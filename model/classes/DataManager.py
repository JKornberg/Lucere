from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, QModelIndex
from ZODB import FileStorage, DB
import ZODB.config
import os
import sys
from model.classes.Trial import Trial
from model.classes.Result import Result
from model.classes.CameraDetails import CameraDetails
from model.classes.CaptureDetails import CaptureDetails
from datetime import datetime
from datetime import timezone
import math
import transaction

from model.classes.QML_ScanModel import ScanModel
from model.classes.QML_CaptureModel import CaptureModel

class DataManager(QObject):
    def __init__(self, scanModel, captureModel):
        super().__init__()
        self.scanModel = scanModel
        self.captureModel = captureModel

        # Append classes folder to PATH
        sys.path.append(os.path.dirname(os.path.realpath(__file__)))

        # Open database
        self.db = ZODB.config.databaseFromURL(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'z.conf'))

    # Read Data
    def LoadTrials(self):
        
        # Create connection
        connection = self.db.open()
        root = connection.root()

        for index in root.trials:
            trial = root.trials[index]
            scan = {
                'id': trial.trialId,
                'date': datetime.fromtimestamp(trial.dateTime).strftime("%m/%d/%Y"),
                'wavelength': trial.result.wavelength,
                'user': root.users[trial.userId].name,
                'detected': trial.result.detected,
                'capture count': math.ceil(trial.captureDetails.count),
                'capture interval': trial.captureDetails.interval,
                'shutter speed': trial.captureDetails.shutter_speed,
                'capture duration': trial.captureDetails.duration,
                'brightness': trial.cameraDetails.brightness,
                'contrast': trial.cameraDetails.contrast,
                'sharpness': trial.cameraDetails.sharpness,
                'iso': trial.cameraDetails.iso,
                'notes': trial.notes,
                'path': trial.scanPaths
            }
            self.scanModel.scanList.append(scan)
            self.captureModel.imageList.append(trial.scanPaths)
        
        # Close connection
        connection.close()

    # Add Data
    @pyqtSlot(int, int, int, int, int, int, int, int, int, str)
    def AddTrial(self, user_id, shutter_speed, duration, interval, count, brightness, contrast, sharpness, iso, resolution):
        # Create connection
        connection = self.db.open()
        root = connection.root()

        date = datetime.now().astimezone(timezone.utc).timestamp() # Get current time in milliseconds
        trial_id = len(root.trials.keys()) # Get trial ID

        # Move pictures from temporary folder to the user data directory
        temp_path = '/home/sadie/Pictures/' # TODO: change on raspberry pi
        trial_path = 'data/user'+str(user_id)+'/trial'+str(trial_id)+'/scan' # Gets trial path
        try:
            os.mkdir('model/classes/data/user'+str(user_id)+'/trial'+str(trial_id)) # Makes trial's directory
        except FileExistsError:
            paths = []
            for i in range(count):
                paths.append(trial_path+str(i)+'.jpg') # Adds image path to list
                
                os.rename((temp_path+str(i)+'.jpg'), ('model/classes/'+paths[i])) # Moves scan from tmp folder
            
            # Adds scan to QML Model
            scan = {
                'id': trial_id,
                'date': datetime.fromtimestamp(date).strftime("%m/%d/%Y"),
                'wavelength': 600, # TODO: Replace placeholders
                'user': root.users[user_id].name,
                'detected': True, # TODO: Replace placeholders
                'capture count': count,
                'capture interval': interval,
                'shutter speed': shutter_speed,
                'capture duration': duration,
                'brightness': brightness,
                'contrast': contrast,
                'sharpness': sharpness,
                'iso': iso,
                'notes': 'No notes.',
                'path': paths
            }
            self.scanModel.scanList.append(scan)
            self.captureModel.add(paths)

            # Creates Trial object
            result = Result(1, 600, 0) # TODO: Replace placeholders
            capture_details = CaptureDetails(shutter_speed, duration, interval, count)
            camera_details = CameraDetails(shutter_speed, 0, brightness, contrast, sharpness, 0, 0, iso, 'Default', resolution)
            trial = Trial(trial_id, user_id, date, paths, 'No notes.', result, capture_details, camera_details)

            # Adds scan to ZODB database
            root.trials.insert(trial_id, trial)
            
            # Commits added scan and closes connection
            transaction.commit()
            connection.close()

    # Delete Data
    @pyqtSlot(int)
    def DeleteTrial(self, count):
        # Create connection
        connection = self.db.open()
        root = connection.root()

        trial_id = len(root.trials.keys()) # Get trial ID

        temp_path = '/home/sadie/Pictures/' # TODO: change on raspberry pi
        for i in range(count):
            os.remove(temp_path+str(i)+'.jpg') # Delete image
        
        # Closes connection
        connection.close()

    # Fetch Users
    @pyqtSlot()
    def FetchUsers(self):
        # Create connection
        connection = self.db.open()
        root = connection.root()

        names = []
        for index in root.users:
            names.append(root.users[index].name)
        
        # Closes connection
        connection.close()
        return names

    # Authenticate User
    @pyqtSlot(str, str, result=bool)
    def AuthenticateUser(self, name, password):
        # Create connection
        connection = self.db.open()
        root = connection.root()

        for index in root.users:
            if root.users[index].name == name and (str(root.users[index].pin) == password or
                (root.users[index].pin is None and password == '')): # Authenticated
                    # Closes connection
                    connection.close()
                    return True
        
        # Closes connection
        connection.close()
        return False

    # Fetch User Id
    @pyqtSlot(str, result=int)
    def FetchUserId(self, name):
        # Create connection
        connection = self.db.open()
        root = connection.root()

        for index in root.users:
            if root.users[index].name == name:
                    # Closes connection
                    connection.close()
                    return root.users[index].userId
        
        # Closes connection
        connection.close()
        return -1

from ZODB import FileStorage, DB
import ZODB.config
import os
import sys
from model.classes.Trial import Trial
from datetime import datetime
import math
from PIL import Image

from model.classes.QML_ScanModel import ScanModel
from model.classes.QML_CaptureModel import CaptureModel

class DataManager:
    def __init__(self, scanModel, captureModel):
        self.scanModel = scanModel
        self.captureModel = captureModel

        # Append classes folder to PATH
        sys.path.append(os.path.dirname(os.path.realpath(__file__)))

        # Open database
        db = ZODB.config.databaseFromURL(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'z.conf'))
        connection = db.open()
        root = connection.root()

        # Reads trials & captures into QML Models
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

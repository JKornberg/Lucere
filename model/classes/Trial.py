import persistent
from datetime import datetime

class Trial(persistent.Persistent):
    def __init__(self, trialId,userId, dateTime, scanPaths, notes, result, captureDetails, cameraDetails):
        self.trialId = trialId
        self.userId = userId
        self.dateTime = dateTime
        self.scanPaths = scanPaths
        self.notes = notes
        self.result = result
        self.captureDetails = captureDetails
        self.cameraDetails = cameraDetails
        
    def edit_notes(self, notes):
        self.notes = notes
        self._p_changed = True

    def format_trial(self):
        return f"Trial: {self.trialId} : {self.userId} : {datetime.fromtimestamp(self.dateTime)} \n Result: Detected: {self.result.detected}, Wavelength: {self.result.wavelength}, Strength: {self.result.strength} \n Path: {self.scanPaths}"
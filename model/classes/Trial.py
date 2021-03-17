import CaptureDetails
import CameraDetails

class Trial(persistent.Persistent):
    def __init__(self, trialId,userId, dateTime, notes, scan, result, captureDetails, cameraDetails):
        self.userId = userId
        self.dateTime = dateTime
        self.notes = notes
        self.scan = scan
        self.result = result
        self.captureDetails = captureDetails
        self.cameraDetails = cameraDetails
        
    def edit_notes(self, notes):
        self.notes = notes
        self._p_changed = True
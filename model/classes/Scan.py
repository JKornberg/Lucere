class Scan(object):

    def __init__(self, scanID, scanDate, scanWave, scanUser):
        self._scanID = scanID
        self._scanDate = scanDate
        self._scanWave = scanWave
        self._scanUser = scanUser

    def scanID(self):
        return self._scanID

    def scanDate(self):
        return self._scanDate
    
    def scanWave(self):
        return self._scanWave
    
    def scanUser(self):
        return self._scanUser
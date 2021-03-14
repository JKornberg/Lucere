from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant

class Scan(object):

    def __init__(self, scanID, scanDate, scanWave):
        self._scanID = scanID
        self._scanDate = scanDate
        self._scanWave = scanWave

    def scanID(self):
        return self._scanID

    def scanDate(self):
        return self._scanDate
    
    def scanWave(self):
        return self._scanWave


class ScanModel(QAbstractListModel):

    IdRole = Qt.UserRole + 1
    DateRole = Qt.UserRole + 2
    WaveRole = Qt.UserRole + 3

    _roles = {IdRole: b"scanID", DateRole: b"scanDate", WaveRole: b"scanWave"}

    def __init__(self, parent=None):
        super(ScanModel, self).__init__(parent)

        self.scanList = []

    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(item)
        self.endInsertRows()

    def rowCount(self, parent=QModelIndex()):
        return len(self.scanList)

    def data(self, index, role=Qt.DisplayRole):
        try:
            scanDetail = self.scanList[index.row()]
        except IndexError:
            return QVariant()

        if role == self.IdRole:
            return scanDetail.scanID()

        if role == self.DateRole:
            return scanDetail.scanDate()
        
        if role == self.WaveRole:
            return scanDetail.scanWave()

        return QVariant()

    def roleNames(self):
        return self._roles
from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant

class ScanModel(QAbstractListModel):

    IdRole = Qt.UserRole + 1
    DateRole = Qt.UserRole + 2
    WaveRole = Qt.UserRole + 3
    ScanRole = Qt.UserRole + 4

    _roles = {IdRole: b"scanID", DateRole: b"scanDate", WaveRole: b"scanWave", ScanRole: b"scanUser"}

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
        
        if role == self.ScanRole:
            return scanDetail.scanUser()

        return QVariant()

    def roleNames(self):
        return self._roles
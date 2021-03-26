from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class ScanModel(QAbstractListModel):

    IdRole = Qt.UserRole + 1
    DateRole = Qt.UserRole + 2
    WaveRole = Qt.UserRole + 3
    ScanRole = Qt.UserRole + 4

    _roles = {IdRole: b"scanID", DateRole: b"scanDate", WaveRole: b"scanWave", ScanRole: b"scanUser"}

    def __init__(self, parent=None):
        super().__init__(parent)

        self.scanList = [
            {'scanID': 100001},
            {'scanID': 100002},
            {'scanID': 100003},
            {'scanID': 100004},
        ]

    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(item)
        self.endInsertRows()

    @pyqtSlot(int)
    def removeScan(self, index):
        scan = self.scanList[index]
        self.beginRemoveRows(QModelIndex(), index, index)
        self.scanList.remove(scan)
        self.endRemoveRows()
    
    @pyqtSlot()
    def addScans(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(
            {'scanID': 100005}
        )
        self.endInsertRows()
    
    @pyqtSlot(int, result=QVariant)
    def get(self, index):
        if 0 <= index < self.rowCount():
            return self.scanList[index]

    def rowCount(self, parent=QModelIndex()):
        return len(self.scanList)

    def data(self, index, role=Qt.DisplayRole):
        try:
            scanDetails = self.scanList[index.row()]
        except IndexError:
            return QVariant()

        if role == ScanModel.IdRole:
            return self.scanList[index.row()]["scanID"]

    def roleNames(self):
        return self._roles
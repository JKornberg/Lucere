from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class ScanModel(QAbstractListModel):

    ID = Qt.UserRole + 1
    Date = Qt.UserRole + 2
    WaveLength = Qt.UserRole + 3
    User = Qt.UserRole + 4
    Detected = Qt.UserRole + 5

    _roles = {ID: b"id", Date: b"date", WaveLength: b"wavelength", User: b"user", Detected: b"detected"}

    def __init__(self, parent=None):
        super().__init__(parent)

        self.scanList = [
            {'id': 100001, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': True},
            {'id': 100002, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': True},
            {'id': 100003, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': False},
            {'id': 100004, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': False},
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
    
    # Just for tests
    @pyqtSlot()
    def addScans(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(
            {'id': 100005, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': True}
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

        if role == ScanModel.ID:
            return self.scanList[index.row()]["id"]
        if role == ScanModel.Date:
            return self.scanList[index.row()]["date"]
        if role == ScanModel.WaveLength:
            return self.scanList[index.row()]["wavelength"]
        if role == ScanModel.User:
            return self.scanList[index.row()]["user"]
        if role == ScanModel.Detected:
            return self.scanList[index.row()]["detected"]

    def roleNames(self):
        return self._roles
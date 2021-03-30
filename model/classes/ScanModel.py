from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class ScanModel(QAbstractListModel):

    # Define Qt roles for attributes
    ID = Qt.UserRole + 1
    Date = Qt.UserRole + 2
    WaveLength = Qt.UserRole + 3
    User = Qt.UserRole + 4
    Detected = Qt.UserRole + 5
    NumberOfCaptures = Qt.UserRole + 6

    _roles = {ID: b"id", Date: b"date", WaveLength: b"wavelength", User: b"user", Detected: b"detected", NumberOfCaptures: b"capture count"}

    # Initialize class
    def __init__(self, parent=None):
        super().__init__(parent)

        # Add some dummy data
        self.scanList = [
            {'id': 100001, 'date': '02/02/2021', 'wavelength': 551, 'user': 'Atticus Steinmetz', 'detected': True, 'capture count': 3},
            {'id': 100002, 'date': '02/03/2021', 'wavelength': 546, 'user': 'Atticus Steinmetz', 'detected': True, 'capture count': 4},
            {'id': 100003, 'date': '02/05/2021', 'wavelength': 550, 'user': 'Atticus Steinmetz', 'detected': False, 'capture count': 6},
            {'id': 100004, 'date': '02/04/2021', 'wavelength': 552, 'user': 'Atticus Steinmetz', 'detected': False, 'capture count': 1}
        ]

        # Default sort by date
        self.sortBy('date')

    # List Sorting
    @pyqtSlot(str)
    def sortBy(self, sortAttribute):
        self.beginResetModel()
        self.scanList.sort(key=lambda x:x[sortAttribute.lower()], reverse=True)
        self.endResetModel()

    # Adds a new item to the class
    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(item)
        self.endInsertRows()

    # Removes an item from the class given its index
    @pyqtSlot(int)
    def removeScan(self, index):
        scan = self.scanList[index]
        self.beginRemoveRows(QModelIndex(), index, index)
        self.scanList.remove(scan)
        self.endRemoveRows()
    
    # Just for tests - adds a new dummy item from QML - test
    @pyqtSlot()
    def addScans(self):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.scanList.append(
            {'id': 100005, 'date': '02/02/2021', 'wavelength': 750, 'user': 'Atticus Steinmetz', 'detected': True, 'capture count': 3}
        )
        self.endInsertRows()
    
    # Returns the item at given index - this is how we expand item details in QML
    @pyqtSlot(int, result=QVariant)
    def get(self, index):
        if 0 <= index < self.rowCount():
            return self.scanList[index]

    # Required method for QAbstractListModel. Returns count of all items in class
    def rowCount(self, parent=QModelIndex()):
        return len(self.scanList)

    # Required method for QAbstractListModel. Binds Qt properties
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
        if role == ScanModel.NumberOfCaptures:
            return self.scanList[index.row()]["capture count"]

    def roleNames(self):
        return self._roles
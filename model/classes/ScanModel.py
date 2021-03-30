from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class ScanModel(QAbstractListModel):

    # Define Qt roles for attributes
    ID = Qt.UserRole + 1
    Date = Qt.UserRole + 2
    WaveLength = Qt.UserRole + 3
    User = Qt.UserRole + 4
    Detected = Qt.UserRole + 5
    NumberOfCaptures = Qt.UserRole + 6
    CaptureInterval = Qt.UserRole + 7
    ShutterSpeed = Qt.UserRole + 8
    TotalRunTime = Qt.UserRole + 9
    Brightness = Qt.UserRole + 10
    Contrast = Qt.UserRole + 11
    Sharpness = Qt.UserRole + 12
    Iso = Qt.UserRole + 13
    Notes = Qt.UserRole + 14

    # Assign Qt roles for attributes
    _roles = {
        ID: b"id",
        Date: b"date",
        WaveLength: b"wavelength",
        User: b"user",
        Detected: b"detected",
        NumberOfCaptures: b"capture count",
        CaptureInterval: b"capture interval",
        ShutterSpeed: b"shutter speed",
        TotalRunTime: b"total run time",
        Brightness: b"brigthness",
        Contrast: b"contrast",
        Sharpness: b"sharpness",
        Iso: b"iso",
        Notes: b"notes"
    }

    # Initialize class
    def __init__(self, parent=None):
        super().__init__(parent)

        # Add some dummy data
        self.scanList = [
            {
                'id': 100001,
                'date': '02/02/2021',
                'wavelength': 551,
                'user':'Atticus Steinmetz',
                'detected': True,
                'capture count': 3,
                'capture interval': 20,
                'shutter speed': 5000,
                'total run time': 400,
                'brightness': 50,
                'contrast': 0,
                'sharpness': 10,
                'iso': 100,
                'notes': 'This scan has some notes stored. Wavelength detection is best with these configurations.'
            }
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
            # Test add one scan
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
        if role == ScanModel.CaptureInterval:
            return self.scanList[index.row()]["capture interval"]
        if role == ScanModel.ShutterSpeed:
            return self.scanList[index.row()]["shutter speed"]
        if role == ScanModel.TotalRunTime:
            return self.scanList[index.row()]["total run time"]
        if role == ScanModel.Brightness:
            return self.scanList[index.row()]["brightness"]
        if role == ScanModel.Contrast:
            return self.scanList[index.row()]["contrast"]
        if role == ScanModel.Sharpness:
            return self.scanList[index.row()]["sharpness"]
        if role == ScanModel.Iso:
            return self.scanList[index.row()]["iso"]
        if role == ScanModel.Notes:
            return self.scanList[index.row()]["notes"]

    def roleNames(self):
        return self._roles
from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class CaptureModel(QAbstractListModel):

    # Define Qt roles for attributes
    Captures = Qt.UserRole + 1

    # Assign Qt roles for attributes
    _roles = {
        Captures: b"scanCaptures",
    }

    # Initialize class
    def __init__(self, parent=None):
        super().__init__(parent)

        # Reads trials into Scan Model
        self.imageList = []

    # Adds a new item to the class
    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.imageList.append(item)
        self.endInsertRows()
       
    # Returns the item at given index - this is how we expand item details in QML
    @pyqtSlot(int, result=QVariant)
    def get(self, index):
        if 0 <= index < self.rowCount():
            return self.imageList[index]

    # Required method for QAbstractListModel. Returns count of all items in class
    def rowCount(self, parent=QModelIndex()):
        return len(self.imageList)

    # Required method for QAbstractListModel. Binds Qt properties
    def data(self, index, role=Qt.DisplayRole):
        try:
            captures = self.imageList[index.row()]
        except IndexError:
            return QVariant()

        if role == CaptureModel.Captures:
            return self.imageList[index.row()]["scanCaptures"]

    def roleNames(self):
        return self._roles
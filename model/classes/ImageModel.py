from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, QUrl

class ImageModel(QAbstractListModel):

    ImageRole = Qt.UserRole + 1

    _roles = {ImageRole: b"captureImage"}

    def __init__(self, parent=None):
        super(ImageModel, self).__init__(parent)

        self.imageList = []

    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.imageList.append(item)
        self.endInsertRows()

    def rowCount(self, parent=QModelIndex()):
        return len(self.imageList)

    def data(self, index, role=Qt.DisplayRole):
        try:
            capture = self.imageList[index.row()]
        except IndexError:
            return QVariant()

        if role == self.ImageRole:
            return capture.captureImage()

        return QVariant()

    def roleNames(self):
        return self._roles
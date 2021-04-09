from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject

class ImageModel(QAbstractListModel):

    # Define Qt roles for attributes
    UrlList = Qt.UserRole + 1

    # Assign Qt roles for attributes
    _roles = {UrlList: b"images",}

    # Initialize class
    def __init__(self, parent=None):
        super().__init__(parent)

        # Reads images into Image Model
        self.imageList = [
            {
                'images': list((
                    "https://picsum.photos/id/1/1920/1080",
                    "https://picsum.photos/id/2/1920/1080",
                    "https://picsum.photos/id/3/1920/1080"
                ))
            },
            {
                'images': list((
                    "https://picsum.photos/id/4/1920/1080",
                    "https://picsum.photos/id/5/1920/1080",
                    "https://picsum.photos/id/6/1920/1080",
                    "https://picsum.photos/id/7/1920/1080",
                    "https://picsum.photos/id/8/1920/1080"
                ))
            },
            {
                'images': list((
                    "https://picsum.photos/id/9/1920/1080",
                    "https://picsum.photos/id/10/1920/1080",
                    "https://picsum.photos/id/11/1920/1080",
                    "https://picsum.photos/id/12/1920/1080"
                ))
            }
        ]

    # Adds a new item to the class
    def add(self, item):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.imageList.append(item)
        self.endInsertRows()

    # Required method for QAbstractListModel. Returns count of all items in class
    def rowCount(self, parent=QModelIndex()):
        return len(self.imageList)

    # Required method for QAbstractListModel. Binds Qt properties
    def data(self, index, role=Qt.DisplayRole):
        try:
            scanDetails = self.imageList[index.row()]
        except IndexError:
            return QVariant()

        if role == ImageModel.UrlList:
            return self.imageList[index.row()]["images"][0]

    def roleNames(self):
        return self._roles
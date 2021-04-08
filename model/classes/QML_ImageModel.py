from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, QUrl
from ZODB import FileStorage, DB
import ZODB.config
import os
import sys
from model.classes.Trial import Trial
from datetime import datetime
import math

class ImageModel(QAbstractListModel):

    ImageRole = Qt.UserRole + 1

    _roles = {ImageRole: b"captureImage"}

    def __init__(self, parent=None):
        super(ImageModel, self).__init__(parent)

        # Append classes folder to PATH
        sys.path.append(os.path.dirname(os.path.realpath(__file__)))

        # Open database
        db = ZODB.config.databaseFromURL(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'z.conf'))
        connection = db.open()
        root = connection.root()

        self.imageList = []
        for index in root.trials:
            trial = root.trials[index]
            captures = {
                # Add images here - 2d array??
            }
            self.scanList.append(captures)

        connection.close()

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
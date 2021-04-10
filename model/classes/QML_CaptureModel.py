from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject
from ZODB import FileStorage, DB
import ZODB.config
import os
import sys
from model.classes.Trial import Trial
from datetime import datetime
import math

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

        # Append classes folder to PATH
        sys.path.append(os.path.dirname(os.path.realpath(__file__)))

        # Open database
        db = ZODB.config.databaseFromURL(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'z.conf'))
        connection = db.open()
        root = connection.root()

        # Reads trials into Scan Model
        self.imageList = []
        for index in root.trials:
            trial = root.trials[index]
            self.imageList.append(trial.scanPaths)

        connection.close()

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
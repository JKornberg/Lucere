from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject
from ZODB import FileStorage, DB
import ZODB.config
import os
import sys
from model.classes.Trial import Trial
from datetime import datetime
import math

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
    CaptureDuration = Qt.UserRole + 9
    Brightness = Qt.UserRole + 10
    Contrast = Qt.UserRole + 11
    Sharpness = Qt.UserRole + 12
    Iso = Qt.UserRole + 13
    Notes = Qt.UserRole + 14
    Path = Qt.UserRole + 15

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
        CaptureDuration: b"capture duration",
        Brightness: b"brigthness",
        Contrast: b"contrast",
        Sharpness: b"sharpness",
        Iso: b"iso",
        Notes: b"notes",
        Path: b"path"
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
        self.scanList = []
        for index in root.trials:
            trial = root.trials[index]
            scan = {
                'id': trial.trialId,
                'date': datetime.fromtimestamp(trial.dateTime).strftime("%m/%d/%Y"),
                'wavelength': trial.result.wavelength,
                'user': root.users[trial.userId].name,
                'detected': trial.result.detected,
                'capture count': math.ceil(trial.captureDetails.count),
                'capture interval': trial.captureDetails.interval,
                'shutter speed': trial.captureDetails.shutter_speed,
                'capture duration': trial.captureDetails.duration,
                'brightness': trial.cameraDetails.brightness,
                'contrast': trial.cameraDetails.contrast,
                'sharpness': trial.cameraDetails.sharpness,
                'iso': trial.cameraDetails.iso,
                'notes': trial.notes,
                'path': trial.scanPaths
            }
            self.scanList.append(scan)

        connection.close()

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

    # Exports scan into a PDF (TODO)
    @pyqtSlot(int)
    def exportScan(self, index):
        print(self.scanList[index]['user'])
        print('SCAN', index)

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
        if role == ScanModel.CaptureDuration:
            return self.scanList[index.row()]["capture duration"]
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
        if role == ScanModel.Path:
            return self.scanList[index.row()]["path"]

    def roleNames(self):
        return self._roles
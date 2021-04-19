from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QVariant, pyqtSlot, QObject
from fpdf import FPDF
from PIL import Image

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

        self.scanList = []

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
        scan = self.scanList[index] # Gets scan

        pdf = FPDF() # Starts pdf
        pdf.add_page() # Creates scan details page
        pdf.set_font('Times', 'B', size=16) # Sets title font
        pdf.cell(10, 5, 'Scan ' + str(scan['id']), ln=1) # Creates title
        pdf.ln(5) # Spacing
        pdf.set_font('Times', size=12) # Sets normal font

        pdf.cell(10, 5, scan['date'], ln=1) # Date
        pdf.cell(10, 5, scan['user'], ln=1) # Technician
        pdf.ln(5) # Spacing

        pdf.set_font('Times', 'B', size=12) # Sets subtitle font
        pdf.cell(10, 5, 'Light Detection', ln=1) # Creates subtitle
        pdf.set_font('Times', size=12) # Sets normal font
        if (scan['detected'] == 0): # No light detected
            pdf.cell(10, 5, 'Light Detected: False', ln=1)
        else: # Light detected
            pdf.cell(10, 5, 'Light Detected: True', ln=1)
        pdf.cell(10, 5, 'Wavelength: ' + str(scan['wavelength']), ln=1) # Wavelength
        pdf.ln(5) # Spacing

        pdf.set_font('Times', 'B', size=12) # Sets subtitle font
        pdf.cell(10, 5, 'Capture Information', ln=1) # Creates subtitle
        pdf.set_font('Times', size=12) # Sets normal font
        pdf.cell(10, 5, 'Capture Count: ' + str(scan['capture count']), ln=1) # Capture count
        pdf.cell(10, 5, 'Capture Interval: ' + str(scan['capture interval']), ln=1) # Capture interval
        pdf.cell(10, 5, 'Shutter Speed: ' + str(scan['shutter speed']), ln=1) # Shutter speed
        pdf.cell(10, 5, 'Capture Duration: ' + str(scan['capture duration']), ln=1) # Capture duration
        pdf.cell(10, 5, 'Brightness: ' + str(scan['brightness']), ln=1) # Brightness
        pdf.cell(10, 5, 'Contrast: ' + str(scan['contrast']), ln=1) # Contrast
        pdf.cell(10, 5, 'Sharpness: ' + str(scan['sharpness']), ln=1) # Sharpness
        pdf.cell(10, 5, 'ISO: ' + str(scan['iso']), ln=1) # ISO

        pdf.ln(5) # Spacing
        pdf.set_font('Times', 'B', size=12) # Sets subtitle font
        pdf.cell(10, 5, 'Notes', ln=1) # Creates subtitle
        pdf.set_font('Times', size=12) # Sets normal font
        pdf.cell(10, 5, str(scan['notes']), ln=1) # Scan notes
        
        # Adds image pages
        for path in scan['path']:
            pdf.add_page('L') # Adds landscape page

            # Creates ratio for resizing image to fit letter page
            ratio = 2550 / 3300
            w, h = Image.open('model/classes/' + path).size
            w = w * ratio

            pdf.image('model/classes/' + path, 0, 0, w=w*0.264583) # Adds image at correct size (in mm)

        pdf.output('exports/'+str(scan['id'])+'.pdf', 'F') # Outputs pdf to exports folder

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
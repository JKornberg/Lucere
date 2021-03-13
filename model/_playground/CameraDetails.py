from PyQt5.QtCore import QAbstractListModel, QModelIndex, Qt, QUrl, QVariant
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView

class CameraDetails(object):

    def __init__(self, scanID, scanDate, scanWave):
        self._scanID = scanID
        self._scanDate = scanDate
        self._scanWave = scanWave

    def scanID(self):
        return self._scanID

    def scanDate(self):
        return self._scanDate
    
    def scanWave(self):
        return self._scanWave


class CameraDetailsModel(QAbstractListModel):

    ScanIdRole = Qt.UserRole + 1
    ScanDateRole = Qt.UserRole + 2
    ScanWaveRole = Qt.UserRole + 3

    _roles = {ScanIdRole: b"scanID", ScanDateRole: b"scanDate", ScanWaveRole: b"scanWave"}

    def __init__(self, parent=None):
        super(CameraDetailsModel, self).__init__(parent)

        self._cameraDetails = []

    def addCameraDetail(self, cameraDetail):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self._cameraDetails.append(cameraDetail)
        self.endInsertRows()

    def rowCount(self, parent=QModelIndex()):
        return len(self._cameraDetails)

    def data(self, index, role=Qt.DisplayRole):
        try:
            scanDetail = self._cameraDetails[index.row()]
        except IndexError:
            return QVariant()

        if role == self.ScanIdRole:
            return scanDetail.scanID()

        if role == self.ScanDateRole:
            return scanDetail.scanDate()
        
        if role == self.ScanWaveRole:
            return scanDetail.scanWave()

        return QVariant()

    def roleNames(self):
        return self._roles


if __name__ == '__main__':
    import sys

    app = QGuiApplication(sys.argv)

    model = CameraDetailsModel()
    model.addCameraDetail(CameraDetails(100000, "02/02/2020", 750))
    model.addCameraDetail(CameraDetails(100001, "02/02/2020", 755))
    model.addCameraDetail(CameraDetails(100002, "02/02/2020", 752))

    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    ctxt = view.rootContext()
    ctxt.setContextProperty('scanModel', model)

    view.setSource(QUrl('resources/qml/views/ScanListCompare.qml'))
    view.show()

    sys.exit(app.exec_())
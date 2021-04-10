from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine, QQmlContext

# Classes
from model.classes.QML_ScanModel import ScanModel
from model.classes.QML_CaptureModel import CaptureModel

import sys

# Define shutdown for cleanup
def shutdown():
    del globals()["engine"]

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    app.aboutToQuit.connect(shutdown)

    # Instantiate Data Models
    scanModel = ScanModel()
    captureModel = CaptureModel()

    # print(captureModel.imageList[0])
    # print(scanModel.scanList)

    engine = QQmlApplicationEngine()
    engine.load(QUrl('resources/qml/components/MainWindow.qml'))

    # Define context properties
    ctx = engine.rootContext()
    ctx.setContextProperty('scanModel', scanModel)
    ctx.setContextProperty('captureModel', captureModel.imageList)

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
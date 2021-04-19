from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine, QQmlContext

# Classes
from model.classes.QML_ScanModel import ScanModel
from model.classes.QML_CaptureModel import CaptureModel
from model.classes.DataManager import DataManager
from model.classes.QML_CaptureModelTemp import CaptureModelTemp
from model.classes.Analysis import Analysis

import sys

"""
Dummy Data Login Information
Name          PIN
----------------------------
Jonah       | 1234
Ciprian     | 1234
guest       | (blank)
"""

# Define shutdown for cleanup
def shutdown():
    del globals()["engine"]

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    app.aboutToQuit.connect(shutdown)

    engine = QQmlApplicationEngine()

    # Define context
    ctx = engine.rootContext()

    # Instantiate Data Models
    scanModel = ScanModel()
    captureModel = CaptureModel()
    captureModelTemp = CaptureModelTemp()
    scanAnalysis = Analysis()

    dataManager = DataManager(scanModel, captureModel, captureModelTemp, scanAnalysis, ctx, '/home/bubu/Pictures/') # TODO: change on raspberry pi
    dataManager.LoadTrials()
    users = dataManager.FetchUsers()

    # Define context properties
    ctx.setContextProperty('scanModel', scanModel)
    ctx.setContextProperty('captureModel', captureModel.imageList)
    ctx.setContextProperty('captureModelTemp', captureModelTemp.tempCaptures)
    ctx.setContextProperty('dataManager', dataManager)
    ctx.setContextProperty('userNames', users)

    engine.load(QUrl('resources/qml/components/MainWindow.qml'))

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
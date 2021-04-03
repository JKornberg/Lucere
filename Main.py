from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine, QQmlContext

# Classes
from model.classes.ScanModel import ScanModel
from model.classes.ImageModel import ImageModel

import sys

# Define shutdown for cleanup
def shutdown():
    del globals()["engine"]

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    app.aboutToQuit.connect(shutdown)

    # Instantiate Data Models
    scanModel = ScanModel()

    engine = QQmlApplicationEngine()
    engine.load(QUrl('/home/bubu/Dev/Lucere/resources/qml/components/MainWindow.qml'))

    # Define context properties
    ctx = engine.rootContext()
    ctx.setContextProperty('scanModel', scanModel)

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
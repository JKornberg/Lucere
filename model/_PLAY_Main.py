from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine
from _PLAY_QMLModels import ScanModel
import sys, os, time

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    # TEST - Instantiate Scan data model
    model = ScanModel()

    engine = QQmlApplicationEngine()
    engine.load(QUrl('/home/bubu/Dev/Lucere/resources/qml/components/MainWindow.qml'))

    # Define context properties
    ctx = engine.rootContext()
    ctx.setContextProperty('scanModel', model)

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
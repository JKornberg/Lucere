from PyQt5.QtCore import QUrl, pyqtSlot, pyqtSignal, QObject
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import qmlRegisterType
import sys, time


# Import Classes
from classes.ScanModel import ScanModel
from classes.ImageModel import ImageModel

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    # TEST - Instantiate Scan data model
    model = ScanModel()

    # qmlRegisterType(ScanModel, 'Scan', 1, 0, 'ScanModel')

    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    ctxt = view.rootContext()
    ctxt.setContextProperty('scanModel', model)

    view.setSource(QUrl('resources/qml/components/MainWindow.qml'))
    view.show()

    sys.exit(app.exec_())
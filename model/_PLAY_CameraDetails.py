from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
import sys


# Import Classes
from classes.ScanList import Scan, ScanModel


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    # Add some items to the scan list
    model = ScanModel()
    model.add(Scan(100001, "02/02/2020", 750, "Atticus Steinmetz"))
    model.add(Scan(100002, "02/02/2020", 755, "Atticus Steinmetz"))
    model.add(Scan(100003, "02/02/2020", 751, "Atticus Steinmetz"))
    model.add(Scan(100004, "02/02/2020", 723, "Atticus Steinmetz"))
    model.add(Scan(100005, "02/02/2020", 758, "Atticus Steinmetz"))
    model.add(Scan(100006, "02/02/2020", 754, "Atticus Steinmetz"))
    model.add(Scan(100007, "02/02/2020", 752, "Atticus Steinmetz"))

    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    ctxt = view.rootContext()
    ctxt.setContextProperty('scanModel', model)

    view.setSource(QUrl('resources/qml/views/ScanGridView.qml'))
    view.show()

    sys.exit(app.exec_())
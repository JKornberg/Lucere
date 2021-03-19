from PyQt5.QtCore import QUrl, QObject
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine
import sys, os

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(QUrl('/home/bubu/Dev/Lucere/resources/qml/pages/main.qml'))

    mainMenu = QQmlComponent(engine)
    mainMenu.loadUrl(QUrl('/home/bubu/Dev/Lucere/resources/qml/views/MainMenu.qml'))

    scanPage = QQmlComponent(engine)
    scanPage.loadUrl(QUrl('/home/bubu/Dev/Lucere/resources/qml/pages/NewScan.qml'))

    for error in mainMenu.errors():
        print(error.toString())

    root = engine.rootObjects()[0].children()[0]

    # Create Scan Page
    scan = scanPage.create()
    scan.setProperty("x", 70)
    scan.setParentItem(root)

    # Create Main Menu
    menu = mainMenu.create()
    menu.setParentItem(root)

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
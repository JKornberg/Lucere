from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine
import sys, os, time

# Demo signal method
class Foo(QObject):
    @pyqtSlot()
    def outputStr(self):
        print("Python Function Executed!")

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(QUrl('/home/bubu/Dev/Lucere/resources/qml/components/MainWindow.qml'))

    test = Foo()

    # Define context properties

    # pages.append("/home/bubu/Dev/Lucere/resources/qml/pages/ScanHistory.qml")

    ctx = engine.rootContext()
    ctx.setContextProperty("test", test)

    # mainMenu = QQmlComponent(engine)
    # mainMenu.loadUrl(QUrl('/home/bubu/Dev/Lucere/resources/qml/views/MainMenu.qml'))

    # for error in mainMenu.errors():
    #     print(error.toString())

    # root = engine.rootObjects()[0].children()[0]

    # Create Page Loader
    # pageLoader = loader.create()
    # # pageLoader.setProperty("x", 70)
    # pageLoader.setParentItem(root)

    # # Create Main Menu
    # menu = mainMenu.create()
    # menu.setParentItem(root)

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
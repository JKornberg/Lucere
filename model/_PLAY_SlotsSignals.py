from PyQt5.QtCore import QUrl, QObject, pyqtSlot, pyqtSignal
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQuick import QQuickView
from PyQt5.QtQml import QQmlEngine, QQmlComponent, QQmlApplicationEngine
import sys, os, time

# Login signal method
class Login(QObject):
    @pyqtSlot(str, str)
    def login(self, name, password):
        # Obviously this verification will change :)
        if ((name == "Sadie Crawford" and password == "123456")
            or (name == "Atticus Steinmetz" and password == "111111")):
                print("Login success!")
        else:
            print("Login failed")

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    login = Login()

    ctx = engine.rootContext()
    ctx.setContextProperty("login", login)

    engine.load(QUrl('resources/qml/components/MainWindow.qml'))

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())

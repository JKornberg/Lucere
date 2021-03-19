from PyQt5.QtQml import QQmlEngine, QQmlComponent
from PyQt5.QtCore import QUrl

class Scan:
    def __init__(self, engine, stackview):
        self.engine = engine
        self.stackview = stackview
    
    def load(self):
        self.component = QQmlComponent(self.engine)
        self.component.loadUrl(QUrl("NewScan.qml"))

        self.scan = self.component.create()

        self.captureButton = self.scan.findChild(QObject, "captureButton")
        
        self.captureButton.clicked.connect(self.captureButton_clicked)

        self.stackview.push(self.scan)
    
    def captureButton_clicked(self):
        self.capture = Capture(self.engine, self.stackview)
        self.capture.load()
import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../views" as Views
import "../components" as Components
import "../pages" as Pages

Window {
    title: qsTr("Lucere Labs")
    minimumWidth: 800
    minimumHeight: 480
    maximumWidth: 800
    maximumHeight: 480
    visible: true
    // visibility: "FullScreen"

    PageLoader {
        id: pageLoader
        source: "../pages/Login.qml"
    }

    Views.MainMenu {
        id: mainMenu

        homeButton.onClicked: {
            pageLoader.source = "../pages/Login.qml"
        }

        scanButton.onClicked: {
            // Execute a Pyton Function
            // test.outputStr()
            
            pageLoader.source = "../pages/NewScan.qml"
        }

        historyButton.onClicked: {
            pageLoader.source = "../pages/ScanHistory.qml"
        }

        exitButton.onClicked: {
            // To be implemented: exit app
        }
    }
}
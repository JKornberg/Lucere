import QtQuick 2.8
import QtQuick.Window 2.8
import "../views"
import "../components"
import "../pages"

Window {
    title: qsTr("Lucere Labs")
    minimumWidth: 800
    minimumHeight: 480
    maximumWidth: 800
    maximumHeight: 480
    visible: true
    // visibility: "FullScreen"

    // Page Loader
    PageLoader {
        id: pageLoader
        asynchronous: true
        source: "../pages/Login.qml"
    }

    MainMenu {
        id: mainMenu

        homeButton.onClicked: {
            pageLoader.source = "../pages/Login.qml"
        }

        scanButton.onClicked: {
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
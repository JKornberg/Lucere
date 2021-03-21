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

    StackLoader {
        id: stackLoader
        initialItem: "../pages/Login.qml"

        Pages.ScanHistory {
            id: scanHistoryPage
            onScanViewButtonPressed: {
                // Action
            }
        }
    }

    Views.MainMenu {
        id: mainMenu

        homeButton.onClicked: {
            stackLoader.clear()
            stackLoader.push("../pages/Login.qml")
        }

        scanButton.onClicked: {
            // Execute a Pyton Function
            // test.outputStr()
            
            stackLoader.clear()
            stackLoader.push("../pages/NewScan.qml")
        }

        historyButton.onClicked: {
            stackLoader.clear()
            stackLoader.push(scanHistoryPage)
        }

        exitButton.onClicked: {
            // To be implemented: exit app
        }
    }
}
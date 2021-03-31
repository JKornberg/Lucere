import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../views" as Views
import "../components" as Components
import "../pages" as Pages

Window {
    // Define global properties
    property int globalIndex: -1
    property bool authenticated: false

    id: mainWindow
    title: qsTr("Lucere Labs")
    minimumWidth: 800
    minimumHeight: 480
    maximumWidth: 800
    maximumHeight: 480
    visible: true
    // visibility: "FullScreen"

    // Create a page loader
    Loader {
        id: pageLoader
        x: 70
        sourceComponent: loginPage
    }

    // Create a menu loader
    Loader {
        id: menuLoader
        sourceComponent: loginMenuComponent
    }

    // Instantiate Login Page
    Component {
        id: loginPage
        Pages.Login {
            loginButton.onClicked: {
                menuLoader.sourceComponent = homeMenuComponent
                pageLoader.sourceComponent = homePage
            }
        }
    }

    // Instantiate Home Page
    Component {
        id: homePage
        Pages.Home {
            switchUserButton.onClicked: {
                menuLoader.sourceComponent = loginMenuComponent
                pageLoader.sourceComponent = loginPage
            }
        }
    }

    // Instantiate Menus
    Component {
        id: homeMenuComponent
        Views.MainMenu {
            id: mainMenu
            onHomeButtonPressed: {            
                pageLoader.sourceComponent = homePage
                pageLoader.asynchronous = true
            }

            onScanButtonPressed: {            
                pageLoader.source = "../pages/NewScan.qml"
                pageLoader.asynchronous = true
            }

            onHistoryButtonPressed: {
                pageLoader.source = "../pages/ScanHistory.qml"
                pageLoader.asynchronous = true
            }

            onExitButtonPressed: {
                // Do work at exit then close
                mainWindow.close()
            }
        }
    }

    Component {
        id: loginMenuComponent
        Views.LoginMenu {
            id: loginMenu

            homeButton.onClicked: {
                pageLoader.sourceComponent = loginPage
            }
            
            exitButton.onClicked: {
                // Do work at exit then close
                mainWindow.close()
            }
        }
    }
}
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
    property bool admin: false // change to be dependent on user logging in

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
            onLoginButtonPressed: {
                menuLoader.sourceComponent = homeMenuComponent
                pageLoader.sourceComponent = homePage
            }

            onExitButtonPressed: {
                // Do work at exit then close
                mainWindow.close()
            }
        }
    }

    // Instantiate Home Page
    Component {
        id: homePage
        Pages.Home {
            onSwitchUserButtonPressed: {
                menuLoader.sourceComponent = loginMenuComponent
                pageLoader.sourceComponent = loginPage
            }

            onExitButtonPressed: {
                // Do work at exit then close
                mainWindow.close()
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

            onOptionsButtonPressed: {
                pageLoader.source = "../pages/CaptureOptions.qml"
                pageLoader.asynchronous = true
            }

            onSettingsButtonPressed: {
                pageLoader.source = "../pages/AppSettings.qml"
                pageLoader.asynchronous = true
            }

            onExportButtonPressed: {
                pageLoader.source = "../pages/ScanExport.qml"
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

            onHomeButtonPressed: {
                pageLoader.sourceComponent = loginPage
            }

            onExitButtonPressed: {
                // Do work at exit then close
                mainWindow.close()
            }
        }
    }
}
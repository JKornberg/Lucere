import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../views" as Views
import "../components" as Components
import "../pages" as Pages
import "../dialogs" as Dialogs

Window {
    // Define global properties
    property int gridCurrentIndex:-1
    property int scanIdGridIndex: -1
    property int listCurrentIndex: -1
    property int scanIdListIndex: -1
    property bool authenticated: false // TODO: admin
    property bool admin: false // TODO: change to be dependent on user logging in
    property int userId: 0
    property string userName: ''

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

            onAnalysisButtonPressed: {
                pageLoader.source = "../pages/Analysis.qml"
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
                scanIdGridIndex = 0
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

    // Create a message (popup) loader
    Loader {
        id: messageLoader
        sourceComponent: undefined
    }

    Component {
        id: messageComponent

        Dialogs.Confirmation {
            id: dialog
            x: 70
            header.text: "Analysis Result"
            body.text: "New scan wavelength and light detection analysis complete."
            yesButtonText: "OK"
            noButtonText: "Cancel"

            onNoButtonPressed: {
                messageLoader.sourceComponent = undefined
            }
            onYesButtonPressed: {
                messageLoader.sourceComponent = undefined
            }
        }
    }

    Connections {
        target: dataManager
        onWaveSignal: {
            messageLoader.sourceComponent = messageComponent
        }
    }
}
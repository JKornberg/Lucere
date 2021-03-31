import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

// Lucere Login Page
Components.LucerePage {
    // Signals
    signal switchUserButtonPressed
    signal exitButtonPressed
    
    id: homePage

    // Logo Image
    Image {
        id: lucereLogo
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: homePage.y + 80

        source: "../../img/lucere-logo.png"
    }

    // Welcome Text
    Text {
        id: welcome
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter
        height: 32
        text: "Welcome, " + "Atticus Steinmetz"
        font.family: "Segoe UI"
        font.weight: Font.Light
        font.pixelSize: 24
        color: AppColors.lightGray
    }

    // Date
    Text {
        id: date
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        height: 16
        color: AppColors.lightGray
        text: new Date().toLocaleDateString(Qt.locale(), "MMMM d, yyyy")
        font.family: "Segoe UI"
        font.pixelSize: 12
    }

    Image {
        id: lucereHexagon
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: date.y + 60
        source: "../../icons/lucere-hexagon.svg"
    }

    Rectangle {
        width: 310
        height: 108
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: lucereHexagon.y + lucereHexagon.height + 40

        // Exit Button
        Controls.LucereButton {
            id: exitButton
            buttonColor: AppColors.lightGray
            buttonText: "Exit"
            onClicked: {
                exitButtonPressed()
            }
        }

        // Switch User Button
        Controls.LucereButton {
            id: switchUserButton
            x: exitButton.width + 10
            buttonColor: AppColors.purple
            buttonText: "Switch User"
            onClicked: {
                switchUserButtonPressed()
            }
        }
    }

    // App Title and Version
    Text {
        id: version
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.height - 40
        height: 16
        color: AppColors.lightGray
        text: "LucereLabs Analysis v1.0.0 Alpha"
        font.family: "Segoe UI"
        font.pixelSize: 12
    }

    // Line Separator
    Components.Separator {
        id: line
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: version.y - 10
        separatorColor: AppColors.borderGray
    }
}
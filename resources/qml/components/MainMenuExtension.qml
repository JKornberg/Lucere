import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors
import "../components" as Components

// Auxiliary menu slides from left
Rectangle {
    id: mainMenuExtension
    implicitWidth: 230
    implicitHeight: 120
    color: AppColors.optionsGray
    x: -230

    // Animation
    Behavior on x {
        PropertyAnimation {
            properties: "x"
            easing.type: Easing.InOutQuad
            duration: 500
        }
    }

    // App Settings
    MouseArea {
        width: 230
        height: 60
        onClicked: {
            // Open Settings Page

            // Close menu
            mainMenuExtension.x = -230
        }

        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? AppColors.darkGray : AppColors.optionsGray
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            x: 25
            source: "../../icons/settings-menu.svg"
        }

        // Title
        Components.MenuLabel {
            text: "Settings"
        }
    }

    // App Export
    MouseArea {
        width: 230
        height: 60
        y: 60

        onClicked: {
            // Open Settings Page

            // Close menu
            mainMenuExtension.x = -230
        }

        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? AppColors.darkGray : AppColors.optionsGray
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            x: 25
            source: "../../icons/export-menu.svg"
        }

        // Title
        Components.MenuLabel {
            text: "Export"
        }
    }
}
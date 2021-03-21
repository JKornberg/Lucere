import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

// Auxiliary menu slides from left
Rectangle {
    id: mainMenuExtension
    implicitWidth: 140
    implicitHeight: 60
    color: AppColors.optionsGray

    // Define open and close state properties
    property string showMenu: "showMenu"
    property string hideMenu: "hideMenu"

    // Define extended menu states
    states: [
        State {
            name: showMenu
            PropertyChanges {
                target: mainMenuExtension
                x: 0
            }
        },

        State {
            name: hideMenu
            PropertyChanges {
                target: mainMenuExtension
                width: -140
            }
        }
    ]

    // Default State
    state: hideMenu

    // Transitions
    transitions: [
        Transition {
            to: "showMenu"
            NumberAnimation {
                duration: 500
                property: "x"
                easing.type: Easing.InOutQuad
            }
        },

        Transition {
            to: "hideMenu"
            NumberAnimation {
                duration: 500
                property: "x"
                easing.type: Easing.InOutQuad
            }
        }
    ]

    // App Settings
    MouseArea {
        width: 70
        height: 60
        onClicked: {
            // Open Settings Page

            // Close menu
            mainMenuExtension.state = hideMenu
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
    }

    // App Export
    MouseArea {
        width: 70
        height: 60
        x: 70

        onClicked: {
            // Open Settings Page

            // Close menu
            mainMenuExtension.state = hideMenu
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
    }
}
import QtQuick 2.8
import QtQuick.Controls 1.4
import "../styles/AppColors.js" as AppColors

// Wrap Menu in Transparent Rectangle
Rectangle {
    id: menuWrapper
    implicitWidth: 70
    implicitHeight: 480
    color: "transparent"
    clip: true

    // Define menu states
    states: [
        State {
            name: "hideMenu"
            PropertyChanges {
                target: menuWrapper
                width: 70
            }
        },

        State {
            name: "showMenu"
            PropertyChanges {
                target: menuWrapper
                width: 230
            }
        }
    ]

    // Default State
    state: "hideMenu"

    // Transitions
    transitions: [
        Transition {
            to: "showMenu"
            NumberAnimation {
                duration: 500
                property: "width"
                easing.type: Easing.InOutQuad
            }
        },

        Transition {
            to: "hideMenu"
            NumberAnimation {
                duration: 500
                property: "width"
                easing.type: Easing.InOutQuad
            }
        }
    ]

    Rectangle {
        id: mainMenu
        implicitWidth: 230
        implicitHeight: 480
        color: AppColors.darkGray

        // App Options Highlight Color
        Rectangle {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 6
            color: AppColors.optionsGray
        }

        // Menu Highlight Animation
        Rectangle {
            id: menuHighlight
            implicitWidth: 230
            implicitHeight: 60
            y: implicitHeight
            color: AppColors.red

            PropertyAnimation {
                target: menuHighlight
                property: "y"
                easing.type: Easing.OutBack
            }

            Behavior on y {
                PropertyAnimation {}
            }
        }

        // Expand Menu Item
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 0
            onClicked: {
                // Animate Image
                menuIcon.rotation == 0 ? (rotateIconOpen.running = true) : (rotateIconClose.running = true)

                // Expand or Collapse Menu
                if (menuWrapper.state == "hideMenu") {
                    menuWrapper.state = "showMenu"
                }
                else {
                    menuWrapper.state = "hideMenu"
                }
            }

            Image {
                id: menuIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 31
                source: "../../icons/expand-menu.svg"

                RotationAnimator {
                    id: rotateIconOpen
                    target: menuIcon
                    from: 0
                    to: 180
                    duration: 500
                    easing.type: Easing.InOutQuad
                    running: false
                }

                RotationAnimator {
                    id: rotateIconClose
                    target: menuIcon
                    from: 180
                    to: 0
                    duration: 500
                    easing.type: Easing.InOutQuad
                    running: false
                }
            }

            // Title
            MenuText {
                text: "Menu Panel"
            }
        }

        // Menu Home
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 1
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/home-menu.svg"
            }

            // Title
            MenuText {
                text: "Home"
            }
        }

        // Menu Scan
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 2
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/scan-menu.svg"
            }

            // Title
            MenuText {
                text: "Capture"
            }
        }

        // Menu History
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 3
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/history-menu.svg"
            }

            // Title
            MenuText {
                text: "Scan History"
            }
        }

        // Menu Analysis
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 4
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/analysis-menu.svg"
            }

            // Title
            MenuText {
                text: "Analysis"
            }
        }

        // Menu Scan Settings
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 5
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/settings-menu.svg"
            }

            // Title
            MenuText {
                text: "Capture Options"
            }
        }

        // Menu App Settings     
        MouseArea {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 6
            onClicked: {
                menuHighlight.y = y
            }

            Image {
                anchors {
                    verticalCenter: parent.verticalCenter
                }
                x: 25
                source: "../../icons/options-menu.svg"
            }

            // Title
            MenuText {
                text: "App Settings"
            }
        }

        // Menu Exit
        Rectangle {
            implicitWidth: 230
            implicitHeight: 60
            y: mainMenu.y + implicitHeight * 7
            color: exitClick.pressed ? Qt.darker(AppColors.purple, 1.1) : AppColors.purple

            MouseArea {
                id: exitClick
                anchors.fill: parent
                onClicked: {
                    // Exit App
                }

                Image {
                    anchors {
                    verticalCenter: parent.verticalCenter
                    }
                    x: 25
                    source: "../../icons/exit-menu.svg"
                }

                // Title
                MenuText {
                    text: "Exit"
                }
            }
        }
    }
}
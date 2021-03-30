import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../styles/AppColors.js" as AppColors

// Menu Container
Rectangle {
    // Properties
    property alias homeButton: homeButton
    property alias scanButton: scanButton
    property alias historyButton: historyButton
    property alias analysisButton: analysisButton
    property alias settingsButton: settingsButton
    property alias exitButton: exitButton

    implicitWidth: 70
    implicitHeight: 480
    color: "transparent"

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
                name: "showMenu"
                PropertyChanges {
                    target: menuWrapper
                    width: 230
                }
            },

            State {
                name: "hideMenu"
                PropertyChanges {
                    target: menuWrapper
                    width: 70
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
                    easing.type: Easing.OutBack
                }
            },

            Transition {
                to: "hideMenu"
                NumberAnimation {
                    duration: 500
                    property: "width"
                    easing.type: Easing.OutBack
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
                    menuWrapper.state === "hideMenu" ? menuWrapper.state = "showMenu" : menuWrapper.state = "hideMenu"
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
                Components.MenuLabel {
                    text: "Menu Panel"
                }
            }

            // Menu Home
            MouseArea {
                id: homeButton
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
                Components.MenuLabel {
                    text: "Home"
                }
            }

            // Menu Scan
            MouseArea {
                id: scanButton
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
                Components.MenuLabel {
                    text: "Capture"
                }
            }

            // Menu History
            MouseArea {
                id: historyButton
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
                Components.MenuLabel {
                    text: "Scan History"
                }
            }

            // Menu Analysis
            MouseArea {
                id: analysisButton
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
                Components.MenuLabel {
                    text: "Analysis"
                }
            }

            // Menu Scan Settings
            MouseArea {
                id: settingsButton
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
                    source: "../../icons/more-menu.svg"
                }

                // Title
                Components.MenuLabel {
                    text: "Capture Options"
                }
            }

            // MainMenu Extension     
            MouseArea {
                implicitWidth: 230
                implicitHeight: 60
                y: mainMenu.y + implicitHeight * 6
                onClicked: {
                    mainMenuExtension.x = 0
                }

                Image {
                    anchors {
                        verticalCenter: parent.verticalCenter
                    }
                    x: 25
                    source: "../../icons/options-menu.svg"
                }

                // Title
                Components.MenuLabel {
                    text: "More..."
                }
            }

            // Menu Exit
            Rectangle {
                implicitWidth: 230
                implicitHeight: 60
                y: mainMenu.y + implicitHeight * 7
                color: exitButton.pressed ? Qt.darker(AppColors.purple, 1.1) : AppColors.purple

                MouseArea {
                    id: exitButton
                    anchors.fill: parent

                    Image {
                        anchors {
                        verticalCenter: parent.verticalCenter
                        }
                        x: 25
                        source: "../../icons/exit-menu.svg"
                    }

                    // Title
                    Components.MenuLabel {
                        text: "Exit"
                    }
                }
            }
        }
    }

    Components.MainMenuExtension {
        id: mainMenuExtension
        x: -230
        y: 300
    }
}
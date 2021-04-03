import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../styles/AppColors.js" as AppColors

// Menu Container
Rectangle {
    // Signals
    signal homeButtonPressed
    signal scanButtonPressed
    signal historyButtonPressed
    signal analysisButtonPressed
    signal optionsButtonPressed
    signal settingsButtonPressed
    signal exportButtonPressed
    signal exitButtonPressed

    id: root
    implicitWidth: 70
    implicitHeight: 480
    color: AppColors.darkGray

    Behavior on width {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    Component {
        id: menuDelegate

        // Wrap Menu in Transparent Rectangle
        Rectangle {
            id: menuWrapper
            implicitWidth: 70
            implicitHeight: 540
            color: "transparent"
            clip: true

            // // Wrapper Animation
            Behavior on width {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.OutBack
                }
            }
            

            Rectangle {
                id: mainMenu
                implicitWidth: 250
                implicitHeight: 480
                color: AppColors.darkGray

                // App Options Highlight Color
                Rectangle {
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 7
                    color: AppColors.optionsGray
                }

                // Menu Highlight Animation
                Rectangle {
                    id: menuHighlight
                    implicitWidth: 250
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
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 0
                    onClicked: {
                        // Animate Image
                        menuIcon.rotation == 0 ? (rotateIconOpen.running = true) : (rotateIconClose.running = true)

                        // Expand or Collapse Menu
                        menuWrapper.width === 70 ? 
                        (menuWrapper.width = 230) && (menuScroll.width = 230) && (root.width = 230) :
                        (menuWrapper.width = 70) && (menuScroll.width = 70) && (root.width = 70)
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
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 1
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        homeButtonPressed()
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
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 2
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        scanButtonPressed()
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
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 3
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        historyButtonPressed()
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
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 4
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        analysisButtonPressed()
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

                // Menu Scan Options
                MouseArea {
                    id: optionsButton
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 5
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        optionsButtonPressed()
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

                // App Settings     
                MouseArea {
                    id: settingsButton
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 6
                    onClicked: {
                        menuHighlight.color = AppColors.red
                        menuHighlight.y = y
                        settingsButtonPressed()
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
                        text: "App Settings"
                    }
                }

                // Export     
                MouseArea {
                    id: exportButton
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 7
                    onClicked: {
                        menuHighlight.color = AppColors.lightGray
                        menuHighlight.y = y
                        exportButtonPressed()
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

                // Menu Exit
                Rectangle {
                    implicitWidth: 250
                    implicitHeight: 60
                    y: mainMenu.y + implicitHeight * 8
                    color: exitButton.pressed ? Qt.darker(AppColors.purple, 1.1) : AppColors.purple

                    MouseArea {
                        id: exitButton
                        anchors.fill: parent
                        onClicked: {
                            exitButtonPressed()
                        }

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
    }

    ListView {
        id: menuScroll
        width: 70
        height: 480
        delegate: menuDelegate
        model: 1
    }
}
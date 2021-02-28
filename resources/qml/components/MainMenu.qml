import QtQuick 2.8
import QtQuick.Controls 1.4
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: mainMenu
    implicitWidth: 70
    implicitHeight: 480
    color: AppColors.darkGray

    // App Options Highlight Color
    Rectangle {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 6
        color: AppColors.optionsGray
    }

    // Menu Highlight Animation
    Rectangle {
        id: menuHighlight
        implicitWidth: 70
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
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 0
        onClicked: {
            // Expand Menu
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/expand-menu.svg"
        }
    }

    // Menu Home
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 1
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/home-menu.svg"
        }
    }

    // Menu Scan
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 2
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/scan-menu.svg"
        }
    }

    // Menu History
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 3
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/history-menu.svg"
        }
    }

    // Menu Analysis
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 4
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/analysis-menu.svg"
        }
    }

    // Menu Scan Settings
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 5
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            source: "../../icons/settings-menu.svg"
        }
    }

    // Menu App Settings     
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 6
        onClicked: {
            menuHighlight.y = y
        }

        Image {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            source: "../../icons/options-menu.svg"
        }
    }

    // Menu Exit
    Rectangle {
        implicitWidth: 70
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
                    horizontalCenter: parent.horizontalCenter
                }

                source: "../../icons/exit-menu.svg"
            }
        }
    }
}
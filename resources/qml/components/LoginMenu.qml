import QtQuick 2.8
import QtQuick.Controls 1.4
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: mainMenu
    implicitWidth: 70
    implicitHeight: 480
    color: AppColors.darkGray

    // Menu Highlight Animation
    Rectangle {
        id: menuHighlight
        implicitWidth: 70
        implicitHeight: 60
        y: implicitHeight
        color: AppColors.red
    }

    // Expand Menu Item
    MouseArea {
        implicitWidth: 70
        implicitHeight: 60
        y: mainMenu.y + implicitHeight * 0
        onClicked: {
            // Animate Image
            menuIcon.rotation == 0 ? (rotateIconOpen.running = true) : (rotateIconClose.running = true)
        }

        Image {
            id: menuIcon
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            source: "../../icons/expand-menu.svg"

            RotationAnimator {
                id: rotateIconOpen
                target: menuIcon
                from: 0
                to: 180
                duration: 500
                running: false
            }

            RotationAnimator {
                id: rotateIconClose
                target: menuIcon
                from: 180
                to: 0
                duration: 500
                running: false
            }
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
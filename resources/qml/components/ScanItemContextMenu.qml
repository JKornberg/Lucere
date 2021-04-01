import QtQuick 2.8
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property alias deleteButton: deleteButton
    property alias compareButton: compareButton

    // Signals
    signal compareButtonPressed

    id: scanContextMenu
    implicitWidth: 220
    implicitHeight: 50
    y: 0
    color: AppColors.borderGray
    radius: 5

    Behavior on y {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    // Compare Button
    Controls.LucereButton {
        id: compareButton
        x: 10
        anchors {
            verticalCenter: parent.verticalCenter
        }
        width: 80
        height: 30
        buttonText: "Compare"
        buttonColor: AppColors.lightGray
    }

    // Delete Button
    Controls.LucereDelayButton {
        id: deleteButton
        x: compareButton.x + compareButton.width + 10
        anchors {
            verticalCenter: parent.verticalCenter
        }
        width: 80
        height: 30
        buttonText: "Delete"
        buttonDelay: 300
        buttonColor: AppColors.red
    }

    // Scan Context Mouse Area
    Rectangle {
        id: scanContextAction
        implicitWidth: 30
        implicitHeight: 50
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        color: "transparent"

        // Context Menu Icon
        Image {
            x: 10
            anchors {
                verticalCenter: parent.verticalCenter
            }
            source: "../../icons/context-menu.svg"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                scanContextMenu.y = 50
            }
        }
    }
}
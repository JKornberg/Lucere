import QtQuick 2.8
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    implicitWidth: 220
    implicitHeight: 50
    color: AppColors.borderGray
    radius: 5

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
        buttonColor: AppColors.red
    }

    // Scan Context Menu
    Rectangle {
        id: scanContextMenu
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
            source: "../../icons/dot-menu.svg"
        }
    }
}
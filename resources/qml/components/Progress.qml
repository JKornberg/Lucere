import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define text property
    property alias message: progressMessage.text
    property alias title: progressTitle.text

    implicitWidth: 690
    implicitHeight: 356
    x: 20
    y: 60
    color: "transparent"
    radius: 10

    Rectangle {
        anchors.centerIn :parent
        anchors.fill: parent
        radius: 10
        color: AppColors.borderGray
        opacity: 0.95

        // Capture Indicator
        Text {
            id: progressTitle
            anchors.horizontalCenter: parent.horizontalCenter
            y: 100
            text: "Title"
            color: AppColors.darkGray
            font.family: "Segoe UI"
            font.pixelSize: 20
        }

        // Busy Indicator
        BusyIndicator {
            id: busyIndicator
            anchors.centerIn: parent
            width: 60
            height: 60
            palette.dark: AppColors.darkGray
        }

        // Scanning in progress
        Text {
            id: progressMessage
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: parent.height - 100
            text: "Message..."
            font.family: "Segoe UI"
            font.pixelSize: 16
            color: AppColors.darkGray
        }
    }
}
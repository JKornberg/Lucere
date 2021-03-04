import QtQuick 2.8
import QtQuick.Controls 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define text property
    property var message: "Message from Python..."

    implicitWidth: 800
    implicitHeight: 480
    color: AppColors.darkGray
    opacity: 0.8

    Rectangle {
        anchors {
            centerIn :parent
        }
        width: 250
        height: 117
        radius: 10
        color: "white"

        BusyIndicator {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            width: 50
            height: 50
            y: 20
            palette.dark: AppColors.lightGray
        }

        Text {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: parent.height - 40
            text: message
            font.family: "Segoe UI"
            font.pixelSize: 16
            color: AppColors.darkGray
        }
    }
}
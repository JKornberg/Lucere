import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define text property
    property int intervalCounter: 5
    property int resetIntervalCounter: 5
    property int captureCounter: 1
    property int captureCount: 1
    property alias captureCountLabel: captureCountLabel.text

    // Signals
    signal timerComplete

    implicitWidth: 160
    implicitHeight: 240
    color: "transparent"

    Rectangle {
        anchors {
            centerIn :parent
        }
        width: 160
        height: 240
        radius: 10
        color: "white"
        opacity: 0.8

        // Capture Indicator
        Text {
            id: captureCountLabel
            anchors.horizontalCenter: parent.horizontalCenter
            y: 15
            text: "Capture " + captureCounter
            color: AppColors.darkGray
            font.family: "Segoe UI"
            font.pixelSize: 16
        }

        // Line Separator
        Components.Separator {
            id: headerLine
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: 50
            width: 130
            separatorColor: AppColors.lightGray
        }

        // Capture Interval
        Text {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: headerLine.y - 5
            text: intervalCounter
            font.family: "Segoe UI"
            font.pixelSize: 80
            color: AppColors.red
        }

        // Line Separator
        Components.Separator {
            id: footerLine
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: 160
            width: 130
            separatorColor: AppColors.lightGray
        }

        // Busy Indicator
        BusyIndicator {
            id: busyIndicator
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            width: 40
            height: 40
            y: footerLine.y + 10
            palette.dark: AppColors.darkGray
        }

        // Scanning in progress
        Text {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            y: parent.height - 30
            text: "Scanning in progress..."
            font.family: "Segoe UI"
            font.pixelSize: 12
            color: AppColors.darkGray
        }
    }
}
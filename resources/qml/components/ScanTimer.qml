import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define text property
    property int intervalCounter: 5
    property int resetIntervalCounter: 5
    property int captureCounter: 1
    property int captureCount: 5

    implicitWidth: 690
    implicitHeight: 350
    color: AppColors.darkGray
    opacity: 0.8

    Rectangle {
        anchors {
            centerIn :parent
        }
        width: 160
        height: 240
        radius: 10
        color: "white"

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
            palette.dark: AppColors.lightGray
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

        // Scan Timer
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: {
                if(captureCounter == captureCount && intervalCounter == 0) {
                    captureCountLabel.text = "Complete"
                    stop()
                }
                else if(intervalCounter == 0) {
                    captureCounter += 1
                    intervalCounter = resetIntervalCounter
                    restart()
                }
                else {
                    intervalCounter -= 1
                }
            }
        }
    }
}
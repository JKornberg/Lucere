import QtQuick 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors
import "../styles/Functions.js" as Functions

Rectangle {
    // Define properties
    property var scanRunTime: Functions.secondsToTime(captureInterval.value * numberOfScans.value)
    property alias numberOfScans: numberOfScans.value
    property alias captureInterval: captureInterval.value
    property alias shutterSpeed: shutterSpeed.value
    property alias brightness: brightness.value
    property alias contrast: contrast.value
    property alias sharpness: sharpness.value
    property alias iso: iso.value

    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

    Rectangle {
        id: captureOptionsWrapper
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: 10
        width: 160
        height: parent.height - 20
        color: "transparent"

        ObjectModel {
            id: itemModel

            Components.PageTitle {
                x: 0
                text: "Setup Multi-Scan:"
            }

            Controls.CaptureSettingSlider {
                id: numberOfScans
                title: "How many scans?"
                from: 1
                to: 30
                stepSize: 1
            }

            Controls.CaptureSettingSlider {
                id: captureInterval
                title: "Scan Interval (s)"
                from: (shutterSpeed.value / 1000).toFixed(0)
                to: 240
                stepSize: 1
                enabled: numberOfScans.value == 1 ? false : true
            }

            Rectangle {
                width: captureOptionsWrapper.width
                height: 20
                color: "transparent"

                Text {
                    anchors.bottom: parent.bottom
                    text: "Total Run Time:"
                    font.family: "Segoe UI"
                    font.pixelSize: 14
                    color: "white"
                }

                Text {
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    text: scanRunTime
                    font.family: "Segoe UI Black"
                    font.pixelSize: 14
                    color: "white"
                }
            }

            Components.PageTitle {
                x: 0
                text: "Camera Controls:"
            }

            Controls.CaptureSettingSlider {
                id: shutterSpeed
                title: "Shutter Speed (ms)"
                from: 0
                to: 20000
                stepSize: 100
            }

            Controls.CaptureSettingSlider {
                id: brightness
                title: "Brightness"
                from: 0
                to: 100
                stepSize: 1
                value: 50
            }

            Controls.CaptureSettingSlider {
                id: contrast
                title: "Contrast"
                from: -100
                to: 100
                stepSize: 10
                value: 0
            }

            Controls.CaptureSettingSlider {
                id: sharpness
                title: "Sharpness"
                from: -100
                to: 100
                stepSize: 10
                value: 0
            }

            Controls.CaptureSettingSlider {
                id: iso
                title: "ISO"
                from: 100
                to: 800
                stepSize: 10
                value: 100
            }

            // Buttons
            Controls.LucereButton {
                buttonText: "Apply"
                buttonColor: AppColors.lightGray
                width: 160
            }

            Controls.LucereButton {
                buttonText: "Save"
                buttonColor: AppColors.red
                width: 160
            }
        }

        ListView {
            anchors.fill: parent
            model: itemModel
            spacing: 10
        }
    }
}
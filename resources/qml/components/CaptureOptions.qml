import QtQuick 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors
import "../styles/Functions.js" as Functions

Rectangle {
    // Define properties
    property var scanRunTime: Functions.secondsToTime(captureInterval.sliderValue * numberOfScans.sliderValue)

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
                optionTitle: "How many scans?"
                sliderFrom: 0
                sliderTo: 20
                stepSize: 1
            }

            Controls.CaptureSettingSlider {
                id: captureInterval
                optionTitle: "Scan Interval (s)"
                sliderFrom: (shutterSpeed.sliderValue / 1000).toFixed(0)
                sliderTo: 240
                stepSize: 1
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
                optionTitle: "Shutter Speed (ms)"
                sliderFrom: 0
                sliderTo: 5000
                stepSize: 50
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Brightness"
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Contrast"
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Sharpness"
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Exposure"
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
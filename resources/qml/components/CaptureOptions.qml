import QtQuick 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define properties
    property var maxNumScans: 0

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
                optionTitle: "Shutter Speed (ms)"
                sliderValue: 80
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Total Capture Time (s)"
            }

            Controls.CaptureSettingSlider {
                optionTitle: "Capture Interval"
            }

            Rectangle {
                width: captureOptionsWrapper.width
                height: 20
                color: "transparent"

                Text {
                    anchors.bottom: parent.bottom
                    text: "Possible Scans:"
                    font.family: "Segoe UI Bold"
                    font.pixelSize: 14
                    color: "white"
                }

                Text {
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    text: maxNumScans
                    font.family: "Segoe UI Bold"
                    font.pixelSize: 14
                    color: "white"
                }
            }

            Components.PageTitle {
                x: 0
                text: "Camera Controls:"
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
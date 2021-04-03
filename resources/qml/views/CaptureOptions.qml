import QtQuick 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors
import "../styles/Functions.js" as Functions

Rectangle {
    id: slider
    // Define properties
    property var scanRunTime:
        captureInterval.enabled ? 
        Functions.secondsToTime((captureInterval.value + shutterSpeed.value / 1000) * numberOfScans.value) : 
        Functions.secondsToTime((shutterSpeed.value / 1000) * numberOfScans.value)
    property alias numberOfScansValue: numberOfScans.value
    property alias captureIntervalValue: captureInterval.value
    property alias shutterSpeedValue: shutterSpeed.value
    property alias brightnessValue: brightness.value
    property alias contrastValue: contrast.value
    property alias sharpnessValue: sharpness.value
    property alias isoValue: iso.value
    property alias applyButton: applyButton
    property alias saveButton: saveButton

    implicitWidth: 250
    implicitHeight: 480
    x: 730
    color: AppColors.darkGray

    Behavior on x {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    Rectangle {
        id: wrapper
        x: 20
        y: 10
        width: 160
        height: parent.height - 20
        color: "transparent"

        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutBack
            }
        }

        ObjectModel {
            id: itemModel

            Components.PageTitle {
                x: 0
                text: "Multi-Capture:"
            }

            Controls.CaptureSettingSlider {
                id: numberOfScans
                title: "How many captures?"
                from: 1
                to: 30
                stepSize: 1
            }

            Controls.CaptureSettingSlider {
                id: captureInterval
                title: "Capture Interval (s)"
                from: (shutterSpeed.value / 1000).toFixed(0)
                to: 240
                stepSize: 1
                enabled: numberOfScans.value == 1 ? false : true
            }

            Rectangle {
                width: wrapper.width
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
                from: -100
                to: 100
                stepSize: 10
                value: 0
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
                id: applyButton
                buttonText: "Apply"
                buttonColor: AppColors.lightGray
                width: 160
                onClicked: {
                    slider.x = 730
                    sliderMouseArea.visible = false
                }
            }

            Controls.LucereButton {
                id: saveButton
                buttonText: "Save"
                buttonColor: AppColors.red
                width: 160

                onClicked: {
                    slider.x = 730
                    sliderMouseArea.visible = false
                }
            }
        }

        ListView {
            anchors.fill: parent
            model: itemModel
            spacing: 10
        }
    }
}
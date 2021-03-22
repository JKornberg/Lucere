import QtQuick 2.8
import QtQml.Models 2.8
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property int index: -1

    // Get Models
    Models.CaptureModel { id: captureModel }
    Models.ScanModel { id: scanModel }

    id: slider
    x: 730
    implicitWidth: 250
    implicitHeight: 480
    color: AppColors.darkGray

    Behavior on x {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    ObjectModel {
        id: contents
        Column {
            id: wrapper
            leftPadding: 20

            // Capture Details
            Components.PageTitle {
                x: 0
                topPadding: 10
                bottomPadding: 5
                text: "Capture Details:"
            }
            Text {
                text: "Number of Scans: " + captureModel.get(index).scanCount
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Capture Interval: " + captureModel.get(index).captureInterval
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Shutter Speed: " + captureModel.get(index).shutterSpeed
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Brightness: " + captureModel.get(index).brightness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Contrast: " + captureModel.get(index).contrast
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Sharpness: " + captureModel.get(index).sharpness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "ISO: " + captureModel.get(index).iso
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }

            // Capture Details
            Components.PageTitle {
                x: 0
                topPadding: 10
                bottomPadding: 5
                text: "Scan Details:"
            }
            Text {
                text: "ID: " + scanModel.get(index).scanID
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Date: " + scanModel.get(index).scanDate
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "User: " + scanModel.get(index).user
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Light Detected: " + scanModel.get(index).lightDetected
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Wavelength: " + scanModel.get(index).scanWave
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }

            // Scan Notes
            Components.PageTitle {
                x: 0
                topPadding: 10
                bottomPadding: 5
                text: "Scan Notes:"
            }
            TextEdit {
                width: 160
                bottomPadding: 10
                text: scanModel.get(index).notes
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
                selectByMouse: true
                selectionColor: AppColors.lightGray
                wrapMode: Text.WordWrap
            }

            // Buttons
            Column {
                spacing: 10
                Controls.LucereButton {
                    buttonText: "Update Notes"
                    buttonColor: AppColors.purple
                    width: 160
                }

                Controls.LucereButton {
                    buttonText: "Close"
                    buttonColor: AppColors.lightGray
                    width: 160

                    onClicked: {
                        slider.x = 730
                    }
                }
            }
        }
    }

    // View Items
    ListView {
        anchors.fill: parent
        model: contents
    }
}
import QtQuick 2.8
import QtQml.Models 2.8
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Get Models
    Models.CaptureModel { id: captureModel }
    Models.ScanModel { id: scanModel }

    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

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
                text: "Number of Scans: " + captureModel.get(0).scanCount
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Capture Interval: " + captureModel.get(0).captureInterval
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Shutter Speed: " + captureModel.get(0).shutterSpeed
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Brightness: " + captureModel.get(0).brightness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Contrast: " + captureModel.get(0).contrast
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Sharpness: " + captureModel.get(0).sharpness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "ISO: " + captureModel.get(0).iso
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
                text: "ID: " + scanModel.get(0).scanID
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Date: " + scanModel.get(0).scanDate
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "User: " + scanModel.get(0).user
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Light Detected: " + scanModel.get(0).lightDetected
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Wavelength: " + scanModel.get(0).scanWave
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
                text: scanModel.get(0).notes
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
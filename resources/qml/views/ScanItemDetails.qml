import QtQuick 2.8
import QtQml.Models 2.8
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    // property int index: -1

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
                text: "Number of Captures: " + scanModel.get(globalIndex)["capture count"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Capture Interval: " + scanModel.get(globalIndex)["capture interval"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Shutter Speed: " + scanModel.get(globalIndex)["shutter speed"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Brightness: " + scanModel.get(globalIndex)["brightness"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Contrast: " + scanModel.get(globalIndex)["contrast"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Sharpness: " + scanModel.get(globalIndex)["sharpness"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "ISO: " + scanModel.get(globalIndex)["iso"]
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
                text: "ID: " + scanModel.get(globalIndex)["id"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Date: " + scanModel.get(globalIndex)["date"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "User: " + scanModel.get(globalIndex)["user"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Light Detected: " + scanModel.get(globalIndex)["detected"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Wavelength: " + scanModel.get(globalIndex)["wavelength"]
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
                text: scanModel.get(globalIndex)["notes"]
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "#F8E4A3"
                selectByMouse: true
                selectionColor: AppColors.lightGray
                wrapMode: Text.WordWrap
            }

            // Buttons
            Column {
                spacing: 10
                bottomPadding: 10
                
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
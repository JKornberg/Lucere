import QtQuick 2.8
import QtQml.Models 2.8
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property int index: -1

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
                text: "Number of Scans: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Capture Interval: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Shutter Speed: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Brightness: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Contrast: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Sharpness: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "ISO: "
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
                text: "ID: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Date: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "User: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Light Detected: "
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
            Text {
                text: "Wavelength: "
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
                text: "No notes..."
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
                        console.log(scanIndex)
                        // console.log(scanModel.get(2)["scanID"])
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
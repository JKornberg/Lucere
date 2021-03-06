import QtQuick 2.8
import QtQuick.Controls 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../models" as Models
import "../styles/AppColors.js" as AppColors

// Wrapper
Rectangle {
    id: wrapper
    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

    ScrollView {
        anchors.fill: parent

    Component {
        id: captureDelegate
        
        Column {
            topPadding: 10
            leftPadding: 20

            // Capture Details
            Components.PageTitle {
                x: 0
                bottomPadding: 10
                text: "Capture Details"
            }

            Text {
                text: "Scan Count: " + scanCount
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Capture Interval: " + captureInterval + " s"
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Shutter Speed: " + shutterSpeed + " ms"
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Brightness: " + brightness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Contrast: " + contrast
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Sharpness: " + sharpness
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "ISO: " + iso
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
            }
        }
    }

    // Capture Details View
    ListView {
        id: captureDetails
        // interactive: false      
        model: Models.CaptureModel {}
        delegate: captureDelegate
    }

    Component {
        id: scanDelegate

        Column {
            leftPadding: 20
            topPadding: 200
            bottomPadding: 10

            // Scan Details
            Components.PageTitle {
                x: 0
                bottomPadding: 10
                text: "Scan Details:"
            }

            Text {
                text: "ID: " + scanID
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Date: " + scanDate
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "User: " + user
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: lightDetected == true ? "Light Detected: YES" : "Light Detected: NO"
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }
            Text {
                text: "Wavelength: " + scanWave + " nm"
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"               
            }

            Components.PageTitle {
                text: "Scan Notes:"
                x: 0
                topPadding: 10
                bottomPadding: 10
            }

            TextEdit {
                width: 160
                bottomPadding: 10
                text: notes
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
                selectionColor: AppColors.lightGray
                wrapMode: TextEdit.WordWrap
                selectByMouse: true
            }
        }
    }
    }

    // Scan Details View
    ListView {
        id: scanDetails
        // interactive: false      
        model: Models.ScanModel {}
        delegate: scanDelegate
    }

    // Update Notes
    Controls.LucereButton {
        id: update
        y: close.y - close.height - 10
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 160
        buttonText: "Update Notes"
        buttonColor: AppColors.purple
    }

    // Close
    Controls.LucereButton {
        id: close
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        width: 160
        buttonText: "Close"
        buttonColor: AppColors.lightGray
    }
}
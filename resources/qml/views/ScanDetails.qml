import QtQuick 2.8
import QtQml.Models 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define properties
    property var numberOfScans: "10"
    property var captureInterval: "20"
    property var shutterSpeed: "5000"
    property var brightness: "63"
    property var contrast: "-20"
    property var sharpness: "10"
    property var iso: "100"
    property var scanID: "000006"
    property var scanDate: "02/22/2021"
    property var user: "Atticus Steinmetz"
    property var light: "YES"
    property var wavelength: "750"
    property var note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ullamcorper malesuada libero vitae lobortis. Maecenas molestie sodales consectetur. Suspendisse suscipit augue est, vehicula ornare ligula convallis sit amet. Proin posuere sed nisi eu pretium."

    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

    // Sidebar Wrapper
    Rectangle {
        id: wrapper
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.y + 10
        width: 160
        height: parent.height - 20
        color: "transparent"

        // Contents of Sidebar
        ObjectModel {
            id: contents

            // Capture Details
            Components.PageTitle {
                x: parent.parent.x
                text: "Capture Details:"
            }

            Components.ScanDetail {
                title: "Number of Scans:"
                detail: numberOfScans
            }

            Components.ScanDetail {
                title: "Capture Interval:"
                detail: captureInterval + " s"
            }

            Components.ScanDetail {
                title: "Shutter Speed:"
                detail: shutterSpeed + " ms"
            }

            Components.ScanDetail {
                title: "Brightness:"
                detail: brightness
            }

            Components.ScanDetail {
                title: "Contrast:"
                detail: contrast
            }

            Components.ScanDetail {
                title: "Sharpness:"
                detail: sharpness
            }

            Components.ScanDetail {
                title: "ISO:"
                detail: iso
            }

            // Scan Details
            Components.PageTitle {
                x: 0
                text: "Scan Details:"
            }

            Components.ScanDetail {
                title: "ID:"
                detail: scanID
            }

            Components.ScanDetail {
                title: "Date:"
                detail: scanDate
            }

            Components.ScanDetail {
                title: "User:"
                detail: user
            }

            Components.ScanDetail {
                title: "Light Detected:"
                detail: light
            }

            Components.ScanDetail {
                title: "Wavelength Estimation:"
                detail: wavelength
            }

            // Scan Notes
            Components.PageTitle {
                x: 0
                text: "Scan Notes:"
            }

            TextEdit {
                width: 160
                anchors.left: parent.left
                text: note
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: "white"
                wrapMode: Text.WordWrap
            }

            // Buttons
            Controls.LucereButton {
                buttonText: "Update Notes"
                buttonColor: AppColors.purple
                width: 163
            }

            Controls.LucereButton {
                buttonText: "Close"
                buttonColor: AppColors.lightGray
                width: 163
            }
        }

        ListView {
            anchors.fill: parent
            model: contents
            spacing: 10
        }
    }
}
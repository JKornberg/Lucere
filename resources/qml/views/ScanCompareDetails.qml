import QtQuick 2.8
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property int scanIndex: -1

    id: wrapper
    implicitWidth: 340
    implicitHeight: 355

    // Capture Swipe View
    Row {
        bottomPadding: 10
        Components.ScanReview {
            id: scanReview
            width: 340
            height: 240
        }
    }

    Row {
        topPadding: 10
        leftPadding: 10

        // Scan Details
        Column {
            y: scanReview.height
            width: scanReview.width / 2

            Text {
                height: 20
                text: "Scan Details:"
                font.family: "Segoe UI Bold"
                font.pixelSize: 14
                color: AppColors.red
            }

            Text {
                text: "ID: " + scanModel.get(scanIndex)["id"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "Date: " + scanModel.get(scanIndex)["date"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "User: " + scanModel.get(scanIndex)["user"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "Light Detected: " + scanModel.get(scanIndex)["detected"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }
        }

        // Capture Details
        Column {
            y: scanReview.height
            width: scanReview.width / 2

            Text {
                height: 20
                text: "Capture Details:"
                font.family: "Segoe UI Bold"
                font.pixelSize: 14
                color: AppColors.purple
            }

            Text {
                text: "Wavelength: " + scanModel.get(scanIndex)["wavelength"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "Shutter Speed: " + scanModel.get(scanIndex)["shutter speed"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "Capture Duration: " + scanModel.get(scanIndex)["wavelength"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            Text {
                text: "Capture Interval: " + scanModel.get(scanIndex)["capture duration"]
                font.family: "Segoe UI"
                font.pixelSize: 12
                color: AppColors.lightGray
            }
        }
    }
}
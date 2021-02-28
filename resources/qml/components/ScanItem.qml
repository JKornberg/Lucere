import QtQuick 2.8
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    implicitWidth: 220
    implicitHeight: 160
    radius: 5
    color: AppColors.componentGray

    // Scan Title
    Rectangle {
        x: 10
        y: 10
        implicitWidth: 200
        implicitHeight: 20
        color: "transparent"

        // Label
        Text {
            id: scanIdLabel
            x: parent.x + 10
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "Scan:"
            font.family: "Segoe UI Semibold"
            font.pixelSize: 16
            color: AppColors.darkGray
        }

        // ID
        Text {
            id: scanId
            x: scanIdLabel.x + scanIdLabel.width + 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "000000"
            font.family: "Segoe UI Semibold"
            font.pixelSize: 16
            color: AppColors.darkGray
        }

        // Icon
        Image {
            anchors {
                verticalCenter: parent.verticalCenter
            }
            source: "../../icons/scan-item.svg"
        }
    }

    // Scan Date
    Rectangle {
        x: 10
        y: 35
        implicitWidth: 200
        implicitHeight: 20
        color: "transparent"

        // Label
        Text {
            id: scanDateLabel
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "Scan:"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }

        // Date
        Text {
            id: scanDate
            x: scanDateLabel.x + scanDateLabel.width + 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "02/02/2021"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }
    }

    // Scan User
    Rectangle {
        x: 10
        y: 55
        implicitWidth: 200
        implicitHeight: 20
        color: "transparent"

        // Label
        Text {
            id: scanUserLabel
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "User:"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }

        // User
        Text {
            id: scanUser
            x: scanUserLabel.x + scanUserLabel.width + 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "Atticus Steinmetz"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }
    }

    // Scan Wavelength
    Rectangle {
        x: 10
        y: 75
        implicitWidth: 200
        implicitHeight: 20
        color: "transparent"

        // Label
        Text {
            id: scanWaveLabel
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "Wavelength:"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }

        // User
        Text {
            id: scanWave
            x: scanWaveLabel.x + scanWaveLabel.width + 5
            anchors {
                verticalCenter: parent.verticalCenter
            }
            text: "750 nm"
            font.family: "Segoe UI Semilight"
            font.pixelSize: 14
            color: AppColors.lightGray
        }
    }

    // Scan View Button
    Controls.LucereButton {
        x: 10
        y: 120
        width: 80
        height: 30
        buttonText: "View"
        buttonColor: AppColors.lightGray
    }

    // Scan Context Menu
    Rectangle {
        id: scanContextMenu
        implicitWidth: 30
        implicitHeight: 50
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        color: "transparent"

        // Context Menu Icon
        Image {
            x: 10
            anchors {
                verticalCenter: parent.verticalCenter
            }
            source: "../../icons/context-menu.svg"
        }
    }
}
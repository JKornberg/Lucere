import QtQuick 2.8
import QtQuick.Controls 2.8
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: wrapper
    implicitWidth: 700
    implicitHeight: 348

    // Radio Button Group
    ButtonGroup {
        id: radioGroup
    }

    Component {
        id: scanDelegate

        Rectangle {
            implicitWidth: 220
            implicitHeight: 150
            radius: 5
            color: AppColors.componentGray
            clip: true

            // Context Menu Animation
            NumberAnimation {
                id: showContextMenu
                target: contextMenu
                property: "y"
                to: 0
                duration: 500
                easing.type: Easing.OutBack
            }

            Column {
                leftPadding: 10
                topPadding: 10

                // Scan ID
                Row {
                    bottomPadding: 10
                    Image {
                        source: "../../icons/scan-item.svg"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            x: parent.width + 5
                            text: "ID: " + scanID
                            font.family: "Segoe UI Semibold"
                            font.pixelSize: 16
                            color: AppColors.darkGray
                        }
                    }
                }

                // Scan Date
                Text {
                    text: 'Date: ' + scanDate
                    font.family: "Segoe UI Semilight"
                    font.pixelSize: 14
                    color: AppColors.lightGray              
                }

                // User
                Text {
                    text: 'User: ' + user
                    font.family: "Segoe UI Semilight"
                    font.pixelSize: 14
                    color: AppColors.lightGray              
                }

                // Scan Wavelength
                Text {
                    text: 'Wavelength: ' + scanWave + " nm"
                    font.family: "Segoe UI Semilight"
                    font.pixelSize: 14
                    color: AppColors.lightGray
                }
            }

            // Action Area
            Rectangle {
                anchors.bottom: parent.bottom
                implicitWidth: 220
                implicitHeight: 50
                color: "transparent"

                // Scan View Button
                Controls.LucereButton {
                    id: viewScan
                    anchors.verticalCenter: parent.verticalCenter
                    x: 10
                    width: 80
                    height: 30
                    buttonText: "View"
                    buttonColor: AppColors.lightGray
                }

                // Scan Context Menu
                Rectangle {
                    id: scanContextMenu
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                    }
                    implicitWidth: 30
                    implicitHeight: 50
                    color: "transparent"

                    // Context Menu Icon
                    Image {
                        x: 10
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                        source: "../../icons/context-menu.svg"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            showContextMenu.running = true
                        }
                    }
                }

                // Slide Scan Item Context Menu
                Components.ScanItemContextMenu {
                    id: contextMenu
                    y: height
                }
            }
        }
    }

    GridView {
        id: scanGridView
        anchors.fill: parent
        cellWidth: 233
        cellHeight: 165

        model: Models.ScanModel {}
        delegate: scanDelegate
    }
}
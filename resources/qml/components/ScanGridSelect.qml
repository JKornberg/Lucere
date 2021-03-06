import QtQuick 2.8
import QtQuick.Controls 2.8
import "../components" as Components
import "../controls" as Controls
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

            Column {
                leftPadding: 10
                topPadding: 15

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

                Row {
                    topPadding: 10
                    Controls.LucereButtonSelect {
                        ButtonGroup.group: radioGroup
                    }
                }
            }
        }
    }

    GridView {
        id: scanGridView
        anchors.fill: parent
        cellWidth: 233
        cellHeight: 165

        model: Components.ScanModel {}
        delegate: scanDelegate
    }
}
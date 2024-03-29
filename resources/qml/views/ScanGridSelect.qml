import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Signals
    signal selectButtonPressed
    // property int scanIndex: -1
    property alias scanGridSelect: scanGridSelect

    id: wrapper
    implicitWidth: 700
    implicitHeight: 356
    clip: true

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
                topPadding: 10

                // Scan ID
                Row {
                    bottomPadding: 10
                    Image {
                        source: "../../icons/scan-item.svg"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            x: parent.width + 5
                            text: "ID: " + id
                            font.family: "Segoe UI Semibold"
                            font.pixelSize: 16
                            color: AppColors.darkGray
                        }
                    }
                }

                // Scan Date
                Text {
                    text: 'Date: ' + date
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
                    text: 'Wavelength: ' + wavelength + " nm"
                    font.family: "Segoe UI Semilight"
                    font.pixelSize: 14
                    color: AppColors.lightGray
                }

                Row {
                    topPadding: 15
                    Controls.LucereButtonSelect {
                        lucereSelectButton.checked: index == 0
                        lucereSelectButton.onClicked: {
                            gridCurrentIndex = scanGridSelect.currentIndex
                            scanIdGridIndex = index
                            selectButtonPressed()
                        }
                    }
                }
            }
        }
    }

    GridView {
        id: scanGridSelect
        delegate: scanDelegate
        anchors.fill: parent
        cellWidth: 233
        cellHeight: 165
    }
}
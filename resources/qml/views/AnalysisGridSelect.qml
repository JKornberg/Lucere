import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../models" as Models
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Signals
    signal selectButtonPressed
    property alias analysisGridSelect: analysisGridSelect

    id: wrapper
    implicitWidth: 700
    implicitHeight: 356
    clip: true

    // Radio Button Group
    ButtonGroup {
        id: radioGroup
    }

    Component {
        id: analysisDelegate

        Rectangle {
            id: analysisWrapper
            implicitWidth: 220
            implicitHeight: 150
            radius: 5
            color: AppColors.componentGray
            clip: true

            Rectangle {
                id: analysisIcon
                x: 190
                y: -50
                width: 100
                height: 100
                color: AppColors.borderGray
                rotation: 45
                transformOrigin: Item.Center
            }

            Image {
                x: 200
                y: 10
                source: "../../icons/analysis-scikit.svg"
            }

            Column {
                leftPadding: 10
                topPadding: 10

                // Algorithm Name
                Row {
                    bottomPadding: 10
                    Image {
                        source: iconUrl

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            x: parent.width + 5
                            text: title
                            font.family: "Segoe UI Semibold"
                            font.pixelSize: 16
                            color: AppColors.darkGray
                        }
                    }
                }

                // Description
                Text {
                    width: 200
                    text: description
                    font.family: "Segoe UI Semilight"
                    font.pixelSize: 12
                    wrapMode: Text.Wrap
                    color: AppColors.darkGray
                }

                Rectangle {
                    x: 10
                    y: 120
                    Controls.LucereButtonSelect {
                        // lucereSelectButton.checked: index == 0
                        lucereSelectButton.onClicked: {
                            slider.x = 530
                            selectButtonPressed()
                        }
                    }
                }
            }
        }
    }

    GridView {
        id: analysisGridSelect
        model: Models.AnalysisModel {}
        delegate: analysisDelegate
        anchors.fill: parent
        cellWidth: 233
        cellHeight: 165
    }
}
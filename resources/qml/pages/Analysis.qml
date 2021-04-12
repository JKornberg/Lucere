import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

StackView {
    // Signals
    signal scanSelected

    id: analysisStack
    width: 730
    height: 480

    initialItem: analysisPage

    Components.LucerePage {
        id: analysisPage
        clip: true

        Components.PageTitle {
            text: "Analysis Algorithms"
        }

        Views.AnalysisGridSelect {
            id: scanSelect
            
            onSelectButtonPressed: {
                slider.x == 530
                sliderMouseArea.visible = true
            }
            x: 20
            y: 60
        }

        Components.InfoLine {
            x: 20
            y: parent.height - 45
            notice: "Select an analysis algorithm to run against a scan."
        }

        // Slider Close Mouse Area
        Components.SliderMouseArea {
            id: sliderMouseArea
            visible: false
            onClicked: {
                slider.x == 530 ? slider.x = 730 : undefined
                visible = false
            }
        }

        Views.ScanListAnalysis {
            id: slider

            onRunButtonPressed: {
                analysisStack.push("AnalysisResults.qml")
            }
        }
    }
}
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
            id: pageTitle
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
            id: infoLine
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
                dataManager.startAnalysis(scanIdListIndex, scanSelect.analysisModel.get(gridCurrentIndex).name)
                scanSelect.visible = false
                progressLoader.sourceComponent = progressComponent
                infoLine.notice = "Analysis in progress..."
            }
        }
    }

    Connections {
        target: dataManager
        onAnalysisSignal: {
            analysisStack.push("AnalysisResults.qml")
            progressLoader.sourceComponent = undefined
            scanSelect.visible = true
            infoLine.notice = "Select analysis algorithm to run against a scan."
        }
    }

    // Progress Component
    Component {
        id: progressComponent
        Components.Progress {
            id: progress
            title: "Running <b>" + scanSelect.analysisModel.get(gridCurrentIndex).title + "</b>"
            message: "Please wait for analysis to complete!"
        }
    }

    // Progress Loader
    Loader {
        id: progressLoader
    }
}
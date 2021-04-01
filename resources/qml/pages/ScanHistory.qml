import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

StackView {
    id: historyStack
    width: 730
    height: 480

    initialItem: scanHistoryPage

    Components.LucerePage {
        id: scanHistoryPage
        clip: true

        Components.PageTitle {
            text: "Scan History"
        }

        Views.ScanGridView {
            id: scanView
            x: 20
            y: 60

            // Set data model
            scanGridView.model: scanModel
            
            onViewButtonPressed: {
                historyStack.push("ScanDetails.qml")
            }
        }

        Components.InfoLine {
            id: infoLine
            x: 20
            y: parent.height - 45
            notice: "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
        }

        Controls.LucereButton {
            x: parent.width - width - 20
            y: parent.height - height - 20
            buttonText: "Sort & Filter Options"
            buttonColor: AppColors.purple

            onClicked: {
                // scanModel.addScans()
                filterSlider.x = 530
            }
        }

        // Filter Slider
        Views.ScanFilter {
            id: filterSlider
        }

        // Scan Picker Slider
        Views.ScanListCompare {
            id: compareSlider

            onPickCompareButtonPressed: {
                console.log("Big compare button pressed")
                infoLine.notice = "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
            }
        }
    }
}
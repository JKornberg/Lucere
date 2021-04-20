import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../dialogs" as Dialogs
import "../styles/AppColors.js" as AppColors

StackView {
    // Properties
    property alias scanGridView: scanView.scanGridView
    property int indexOnDelete: 0

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

            onDeleteButtonPressed: {
                confirmationLoader.sourceComponent = confirmationComponent
                indexOnDelete = scanModel.get(gridCurrentIndex)["id"]
                scanGridView.interactive = false
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
                sliderMouseArea.visible = true
            }
        }

        // Slider Close Mouse Area
        Components.SliderMouseArea {
            id: sliderMouseArea
            visible: false
            onClicked: {
                filterSlider.x == 530 ? filterSlider.x = 730 : undefined
                compareSlider.x == 530 ? compareSlider.x = 730 : undefined
                infoLine.notice = "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
                visible = false
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
                infoLine.notice = "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
                historyStack.push("ScanComparison.qml")
            }
        }
    }

    // Confirmation Message
    Component {
        id: confirmationComponent

        Dialogs.Confirmation {
            header.text: "Action Required"
            body.text: "Are you sure you want to delete <b>scan  " + scanIdGridIndex + "</b>? This action cannot be undone."

            onNoButtonPressed: {
                confirmationLoader.sourceComponent = undefined
                scanGridView.interactive = true
            }

            onYesButtonPressed: {
                scanModel.removeScan(gridCurrentIndex)
                dataManager.DeleteScan(indexOnDelete)
                confirmationLoader.sourceComponent = undefined
                scanGridView.interactive = true
            }
        }
    }

    // Confirmation Message Loader
    Loader {
        id: confirmationLoader
    }
}
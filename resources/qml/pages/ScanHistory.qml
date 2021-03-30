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

            // Set data model
            scanGridView.model: scanModel
            
            onViewButtonPressed: {
                historyStack.push (
                    Qt.createComponent("ScanDetails.qml").createObject(historyStack)
                )
            }
            x: 20
            y: 60
        }

        Components.InfoLine {
            x: 20
            y: parent.height - 40
            notice: "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
        }

        Controls.LucereButton {
            x: parent.width - width - 20
            y: parent.height - height - 20
            buttonText: "Sort & Filter Options"
            buttonColor: AppColors.purple

            onClicked: {
                // scanModel.addScans()
                slider.x = 530
            }
        }

        // Slider
        Views.ScanFilter {
            id: slider
        }
    }
}
import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components"
import "../controls"
import "../views"
import "../styles/AppColors.js" as AppColors

StackView {
    id: historyStack
    width: 730
    height: 480

    initialItem: scanHistoryPage

    LucerePage {
        id: scanHistoryPage
        clip: true

        PageTitle {
            text: "Scan History"
        }

        ScanGridView {
            id: scanView
            onViewButtonPressed: {
                historyStack.push (
                    Qt.createComponent("ScanDetails.qml").createObject(historyStack, {"index" : scanGridView.currentIndex})
                )
            }
            x: 20
            y: 60
        }

        InfoLine {
            x: 20
            y: parent.height - 40
            notice: "Touch View for scan details. Use <b>three-dot</b> context menu for more options."
        }

        LucereButton {
            x: parent.width - width - 20
            y: parent.height - height - 20
            buttonText: "Sort & Filter Options"
            buttonColor: AppColors.purple

            onClicked: {
                slider.x = 530
            }
        }

        // Slider
        ScanFilter {
            id: slider
        }
    }
}
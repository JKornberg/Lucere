import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.8
import "../components"
import "../controls"
import "../views"
import "../styles/AppColors.js" as AppColors

LucerePage {
    // Button Signals
    signal scanViewButtonPressed

    id: scanHistoryPage
    clip: true

    PageTitle {
        text: "Scan History"
    }

    ScanGridView {
        id: scanGridView
        onViewButtonPressed: {
            scanViewButtonPressed()
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
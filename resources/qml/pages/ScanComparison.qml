import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Scan Comparison Page
Components.LucerePage {
    // Properties
    property StackView historyStack: StackView.view

    id: scanComparison
    clip: true

    // Page Title
    Components.PageTitle {
        text: "Scan Comparison"
    }

    Components.InfoLine {
        id: infoLine
        x: 20
        y: parent.height - 45
        notice: "Side by side scan comparison"
    }

    Views.ScanCompareDetails {
        id: scanCompareLeft
        x: 20
        y: 60
    }

    Views.ScanCompareDetails {
        id: scanCompareRight
        x: parent.width / 2 + 10
        y: 60
    }

    // Save Button
    Controls.LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 165
        buttonText: "Close"
        buttonColor: AppColors.lightGray

        onClicked: {
            historyStack.pop()
        }
    }
}
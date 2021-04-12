import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Analysis Results
Components.LucerePage {
    // Properties
    signal closeButtonPressed

    id: analysisCompletePage
    clip: true

    Components.PageTitle {
        text: "Analysis Results"
    }

    Components.ScanAnalysisReview {
        id: analysisReview
        x: 20
        y: 60
    }

    Components.InfoLine {
        x: 20
        y: parent.height - 45
        notice: "Use swipe to review this analysis"
    }

    Controls.LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 180
        buttonText: "Export Results"
        buttonColor: AppColors.purple

        onClicked: {
            // Export Results
        }
    }

    Controls.LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 180
        buttonText: "Close"
        buttonColor: AppColors.lightGray

        onClicked: {
            analysisStack.pop()
            closeButtonPressed()
        }
    }
}
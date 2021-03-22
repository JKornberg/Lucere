import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Capture Complete Page
Components.LucerePage {
    id: captureCompletePage
    clip: true

    Components.PageTitle {
        text: "Capture Complete"
    }

    Components.ScanReview {
        id: scanReview
        x: 20
        y: 60
    }

    Components.InfoLine {
        x: 20
        y: parent.height - 40
        notice: "Use swipe to review all captures in this scan"
    }

    Controls.LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 180
        buttonText: "Save & Analyze"
        buttonColor: AppColors.purple
    }

    Controls.LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 180
        buttonText: "Discard"
        buttonColor: AppColors.lightGray
    }
}
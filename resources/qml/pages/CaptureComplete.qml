import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.8
import "../components"
import "../controls"
import "../views"
import "../styles/AppColors.js" as AppColors

// Lucere Login Page
LucerePage {
    id: captureCompletePage
    clip: true

    PageTitle {
        text: "Capture Complete"
    }

    ScanReview {
        id: scanReview
        x: 20
        y: 60
    }

    InfoLine {
        x: 20
        y: parent.height - 40
        notice: "Use swipe to review all captures in this scan"
    }

    LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 180
        buttonText: "Save & Analyze"
        buttonColor: AppColors.purple
    }

    LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 180
        buttonText: "Discard"
        buttonColor: AppColors.lightGray
    }
}
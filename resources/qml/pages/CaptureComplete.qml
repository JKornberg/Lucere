import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Capture Complete Page
Components.LucerePage {
    // Properties
    property StackView newScanStack: StackView.view
    signal discardButtonPressed

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
        y: parent.height - 45
        notice: "Use swipe to review all captures in this scan"
    }

    Controls.LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 180
        buttonText: "Save & Analyze"
        buttonColor: AppColors.purple

        onClicked: {
            dataManager.AddTrial(userId, newScanStack.shutterSpeed, newScanStack.duration, newScanStack.interval,
                                    newScanStack.count, newScanStack.brightness, newScanStack.contrast,
                                    newScanStack.sharpness, newScanStack.iso, newScanStack.resolution)
            newScanStack.pop()
            discardButtonPressed()
        }
    }

    Controls.LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 180
        buttonText: "Discard"
        buttonColor: AppColors.lightGray

        onClicked: {
            dataManager.DeleteTrial(newScanStack.count)
            newScanStack.pop()
            discardButtonPressed()
        }
    }
}
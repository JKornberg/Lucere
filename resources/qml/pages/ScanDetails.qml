import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components"
import "../controls"
import "../views"
import "../styles/AppColors.js" as AppColors

LucerePage {
    // Properties
    property StackView historyStack: StackView.view
    // property int scanIndex: -1

    id: scanDetailsPage
    clip: true

    PageTitle {
        text: "Scan Details"
    }

    ScanReview {
        id: scanDetails
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
        buttonText: "Scan Details & Notes"
        buttonColor: AppColors.purple

        onClicked: {
            slider.x = 530
        }
    }

    LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        buttonText: "Cancel"
        buttonColor: AppColors.lightGray

        onClicked: {
            historyStack.pop()
        }
    }

    ScanItemDetails {
        id: slider
    }
}
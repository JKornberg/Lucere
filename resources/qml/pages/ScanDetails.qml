import QtQuick 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

Components.LucerePage {
    // Properties
    property StackView historyStack: StackView.view

    id: scanDetailsPage
    clip: true

    Components.PageTitle {
        text: "Scan Details"
    }

    Components.ScanReview {
        id: scanDetails
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
        buttonText: "Scan Details & Notes"
        buttonColor: AppColors.purple

        onClicked: {
            slider.x = 530
            sliderMouseArea.visible = true
        }
    }

    Controls.LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        buttonText: "Cancel"
        buttonColor: AppColors.lightGray

        onClicked: {
            historyStack.pop()
        }
    }

    // Slider Close Mouse Area
    Components.SliderMouseArea {
        id: sliderMouseArea
        visible: false
        onClicked: {
            slider.x == 530 ? slider.x = 730 : undefined
            visible = false
        }
    }

    Views.ScanItemDetails {
        id: slider
    }
}
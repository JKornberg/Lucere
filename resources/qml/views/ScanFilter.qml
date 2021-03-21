import QtQuick 2.8
import QtQuick.Controls 2.4
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: slider
    x: 730
    width: 250
    height: 480
    color: AppColors.darkGray

    Behavior on x {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutBack
        }
    }

    // Wrapper
    Rectangle {
        id: wrapper
        width: 200
        height: 400
        color: "transparent"

        // Title
        Text {
            x: wrapper.x + 20
            y: wrapper.y + 10
            text: "SORT & FILTER"
            font.family: "Segoe UI Semibold"
            font.pixelSize: 16
            color: AppColors.borderGray
        }

        // Sort By
        Text {
            x: wrapper.x + 20
            y: wrapper.y + 46
            text: "Sort By:"
            font.family: "Segoe UI Semibold"
            font.pixelSize: 16
            color: AppColors.lightGray
        }

        // Sort By Options
        ButtonGroup {
            id: radios
        }

        ListView {
            width: 162
            height: 110
            x: wrapper.x + 20
            y: wrapper.y + 77
            spacing: 10
            interactive: false
            
            model: ["Date", "Wavelength", "Number of Scans"]

            delegate : Controls.LucereRadioButton {
                text: modelData
                textColor: "#ffffff"
                rectColor: AppColors.borderGray
                circleColor: AppColors.lightGray
                checked: index == 0
                ButtonGroup.group: radios
            }
        }

        // Filter Options
        Text {
            x: wrapper.x + 20
            y: wrapper.y + 208
            text: "Filter Options:"
            font.family: "Segoe UI Semibold"
            font.pixelSize: 16
            color: AppColors.lightGray
        }

        Controls.LucereSwitch {
            x: wrapper.x + 20
            y: wrapper.y + 239
            text: "View All Scans"
            textColor: "#ffffff"
            rectColor: AppColors.borderGray
            circleColor: AppColors.borderGray
            toggleButtonColor: AppColors.lightGray
            toggleColor: AppColors.purple
        }
    }

    // Apply & Close Button
    Controls.LucereButton {
        width: 162
        height: 36
        x: wrapper.x + 20
        y: wrapper.y + 424
        buttonColor: AppColors.purple
        buttonText: "Apply & Close"

        onClicked: {
            slider.x = 730
        }
    }
}
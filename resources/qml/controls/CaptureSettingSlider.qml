import QtQuick 2.8
import QtQuick.Controls 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define properties
    property alias optionTitle: optionTitle.text
    property var optionValue: 5000
    property alias sliderValue: slider.value
    property alias sliderFrom: slider.from
    property alias sliderTo: slider.to
    property alias stepSize: slider.stepSize

    implicitWidth: 160
    implicitHeight: 50
    color: "transparent"

    Text {
        id: optionTitle
        text: "Option Title"
        font.family: "Segoe UI Light"
        font.pixelSize: 14
        color: "white"
    }

    Text {
        anchors.right: parent.right
        text: optionValue
        font.family: "Segoe UI Semibold"
        font.pixelSize: 14
        color: "white"
    }

    // Lucere Slider
    Slider {
        id: slider
        y: 25
        width: 170
        height: 20
        value: 10
        from: 1
        to: 100
        stepSize: 5
        snapMode: Slider.SnapAlways

        background: Rectangle {
            x: slider.x
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            implicitWidth: 160
            implicitHeight: 4
            width: slider.availableWidth
            height: implicitHeight
            color: AppColors.borderGray

            Rectangle {
                width: slider.visualPosition * parent.width
                height: parent.height
                color: AppColors.lightGray
            }
        }

        handle: Rectangle {
            x: slider.visualPosition * (slider.availableWidth - width)
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            implicitWidth: 20
            implicitHeight: 20
            radius: 10
            color: "white"
        }
    }
}
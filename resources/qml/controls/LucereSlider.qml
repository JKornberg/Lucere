import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

// Lucere Slider
Slider {
    // Custom properties
    property alias backgroundColor: backgroundRect.color
    property alias sliderColor: fillColorRect.color
    property alias dotColor: handle.color

    id: slider
    y: 25
    width: 170
    height: 20
    value: 0
    from: 0
    to: 100
    stepSize: 5
    snapMode: Slider.SnapAlways

    background: Rectangle {
        id: backgroundRect
        x: slider.x
        y: slider.topPadding + slider.availableHeight / 2 - height / 2
        implicitWidth: 160
        implicitHeight: 4
        width: slider.availableWidth
        height: implicitHeight
        color: AppColors.borderGray

        Rectangle {
            id: fillColorRect
            width: slider.visualPosition * parent.width
            height: parent.height
            color: AppColors.lightGray
        }
    }

    handle: Rectangle {
        id: handle
        x: slider.visualPosition * (slider.availableWidth - width)
        y: slider.topPadding + slider.availableHeight / 2 - height / 2
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
        color: slider.enabled == true ? "white" : AppColors.lightGray
    }
}
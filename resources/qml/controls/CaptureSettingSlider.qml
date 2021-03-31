import QtQuick 2.8
import QtQuick.Controls 2.4
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define properties
    property alias title: optionTitle.text
    property alias value: slider.value
    property alias from: slider.from
    property alias to: slider.to
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
        text: slider.value
        font.family: "Segoe UI Semibold"
        font.pixelSize: 14
        color: "white"
    }

    Controls.LucereSlider {
        id: slider
    }
}
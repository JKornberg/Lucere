import QtQuick 2.8
import "../components" as Components
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    property alias sliderTitle: settingTitle.text
    property alias svg: settingTitle.svg
    property alias value: slider.value
    property alias from: slider.from
    property alias to: slider.to
    property alias stepSize: slider.stepSize

    width: slider.width
    height: 49

    Components.SettingTitle {
        id: settingTitle
    }

    // Value
    Text {
        anchors.right: parent.right
        rightPadding: 18
        text: slider.value
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.darkGray
    }

    Controls.LucereSlider {
        id: slider
        value: 50
        from: 0
        to: 100
        stepSize: 5
        width: 320
        backgroundColor: AppColors.borderGray
        sliderColor: AppColors.lightGray
        dotColor: AppColors.darkGray
    }
}

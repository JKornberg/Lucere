import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    property string svg: 'camera.svg'
    property alias text: subtitleText.text

    implicitWidth: 200
    height: 20

    Image {
        id: svgImage
        y: parent.height / 2 - subtitleText.height / 2
        source: '../../icons/' + svg
    }

    Text {
        id: subtitleText
        x: 30
        y: svgImage.height / 2 - contentHeight / 2
        text: "Sub Title"
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.darkGray
    }
}

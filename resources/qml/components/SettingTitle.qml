import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    property string svg: 'brightness.svg'
    property alias text: titleText.text

    implicitWidth: 200
    height: 20

    Image {
        id: svgImage
        y: parent.height / 2 - titleText.height / 2
        source: '../../icons/' + svg
    }

    Text {
        id: titleText
        x: 21
        y: svgImage.height / 2 - contentHeight / 2
        text: "Setting"
        font.family: "Segoe UI Light"
        font.pixelSize: 16
        color: AppColors.darkGray
    }
}

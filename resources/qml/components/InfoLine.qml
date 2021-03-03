import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define notice property
    property var notice: "Notice..."

    implicitWidth: 100
    implicitHeight: 20

    Text {
        x: 30
        text: notice
        font.family: "Segoe UI"
        font.pixelSize: 12
        color: AppColors.lightGray
    }

    Image {
        source: "../../icons/info-text.svg"
    }
}
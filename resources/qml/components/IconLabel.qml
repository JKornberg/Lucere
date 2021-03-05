import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property alias icon: icon.source

    implicitWidth: 200
    implicitHeight: 20
    color: "transparent"

    Image {
        id: icon
        anchors.verticalCenter: parent.verticalCenter
        source: "../../icons/user-management.svg"
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        x: 30
        text: "Label with icon"
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.darkGray
    }
}
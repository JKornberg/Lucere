import QtQuick 2.8
import QtQuick.Controls 2.8
import QtQuick.Controls.Styles 1.4

TextField {
    // Define border color property
    property var borderColor: "#000000"

    implicitWidth: 76
    implicitHeight: 38
    placeholderText: "Placeholder"
    font.family: "Segoe UI"
    font.pixelSize: 16

    background: Rectangle {
        anchors.fill: parent
        radius: 5
        border.color: borderColor
    }

    maximumLength: 6
}
import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

TextField {
    // Define border color property
    property var borderColor: "#000000"

    width: 101
    height: 37
    placeholderText: "Placeholder"
    font.family: "Segoe UI"

    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: 5
        border.color: borderColor
    }

    maximumLength: 6
}
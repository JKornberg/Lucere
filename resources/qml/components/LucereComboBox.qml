import QtQuick 2.8
import QtQuick.Controls 2.4

ComboBox {
    id: combo

    // Define properties
    property string placeholderText: "Placeholder"
    property string placeholderColor: "#000000"
    property string optionColor: "#000000"
    property string borderColor: "#000000"
    property var contents: ["item1", "item2", "item3"]

    implicitWidth: 226
    implicitHeight: 38
    model: contents

    // Selection text
    currentIndex: -1
    displayText: currentIndex == -1 ? placeholderText : currentText

    // Background of main rectangle
    background: Rectangle {
        width: parent.width
        height: parent.height
        color: "white"
        radius: 5
        border.color: borderColor
    }

    // Stylization of main rectangle's text
    contentItem: Text{
        text: displayText
        color: currentIndex == -1 ? placeholderColor: optionColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: 10
    }

    // Dropdown contents
    delegate: ItemDelegate {
        width: parent.width
        contentItem: Text {
            text: modelData
            font.family: "Segoe UI"
            font.pixelSize: 16
            color: optionColor
        }
    }
}
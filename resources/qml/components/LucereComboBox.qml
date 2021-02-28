import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

ComboBox {
    id: combo

    // Define placeholderText property
    property var placeholderText: "Placeholder"

    // Define placeholderColor property
    property var placeholderColor: "#000000"

    // Define optionColor property
    property var optionColor: "#000000"

    // Define borderColor property
    property var borderColor: "#000000"

    // Define contents property
    property var contents: ["item1", "item2", "item3"]

    implicitWidth: 229
    implicitHeight: 37
    model: contents

    // Selection text
    currentIndex: -1
    displayText: currentIndex == -1 ? placeholderText : currentText

    // Background of main rectangle
    background: Rectangle {
        width: parent.width
        height: parent.height
        color: white
        radius: 5
        border.color: borderColor
    }

    // Stylization of main rectangle's text
    contentItem: Text{
        text: nameSelect.displayText
        color: nameSelect.currentIndex == -1 ? placeholderColor: optionColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: 13
    }

    // Dropdown contents
    delegate: ItemDelegate {
        width: parent.width
        contentItem: Text {
            text: modelData
            font.family: "Segoe UI"
            color: optionColor
        }
    }
}
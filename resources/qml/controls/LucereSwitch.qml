import QtQuick 2.8
import QtQuick.Controls 2.4

SwitchDelegate {
    id: toggle

    // Define custom properties
    property var textColor: "#000000"
    property var rectColor: "#000000"
    property var circleColor: "#000000"
    property var toggleButtonColor: "#000000"
    property var toggleColor: "green"
    property alias buttonWidth: toggle.implicitWidth
    property alias buttonHeight: toggle.implicitHeight
    
    text: "Text"
    implicitWidth: 162
    implicitHeight: 30

    // Button Text
    contentItem: Text {
        text: toggle.text
        font.family: "Segoe UI Light"
        font.pixelSize: 14
        color: toggle.down ? Qt.darker(parent.textColor, 1.1) : parent.textColor
        verticalAlignment: Text.AlignVCenter
    }

    // Switch Indicator
    indicator: Rectangle {
        width: 36
        height: 14
        x: parent.width - 46
        y: parent.height / 2.0 - 7.0
        radius: 11
        color: toggle.checked ? toggleColor : toggleButtonColor

        Rectangle {
            width: 20
            height: 20
            x: toggle.checked ? parent.width - 20 : 0
            y: parent.height / 2.0 - 10
            radius: 11
            color: circleColor
        }
    }

    // Background Rectangle
    background: Rectangle {
        implicitWidth: buttonWidth
        implicitHeight: buttonHeight
        radius: 5
        opacity: 0.05
        color: toggle.checked ? Qt.darker(parent.rectColor, 1.1) : parent.rectColor
    }
}

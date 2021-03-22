import QtQuick 2.8
import QtQuick.Controls 2.4

RadioDelegate {
    id: radio

    // Define custom properties
    property string textColor: "#000000"
    property string rectColor: "#000000"
    property string circleColor: "#000000"
    property alias buttonWidth: radio.implicitWidth
    property alias buttonHeight: radio.implicitHeight
    
    text: "Text"
    implicitWidth: 162
    implicitHeight: 30

    // Button Text
    contentItem: Text {
        text: radio.text
        font.family: "Segoe UI Light"
        font.pixelSize: 14
        color: radio.down ? Qt.darker(parent.textColor, 1.1) : parent.textColor
        verticalAlignment: Text.AlignVCenter
    }

    // Radio Circle
    indicator: Rectangle {
        width: 20
        height: 20
        x: parent.width - 30
        y: parent.height / 2.0 - 10.0
        radius: 11
        color: "transparent"
        border.width: 2
        border.color: radio.down ? Qt.darker(parent.circleColor, 1.1) : parent.circleColor

        Rectangle {
            width: 10
            height: 10
            x: 5
            y: 5
            radius: 6
            color: radio.down ? Qt.darker(parent.parent.circleColor, 1.1) : parent.parent.circleColor
            visible: radio.checked
        }
    }

    // Background Rectangle
    background: Rectangle {
        implicitWidth: buttonWidth
        implicitHeight: buttonHeight
        radius: 5
        opacity: 0.05
        color: radio.down ? Qt.darker(parent.rectColor, 1.1) : parent.rectColor
    }
}

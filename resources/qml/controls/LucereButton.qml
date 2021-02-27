import QtQuick 2.8
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: lucereButton

    // Define button color property
    property var buttonColor: "#000000"

    // Define button text property
    property var buttonText: "Lucere Button"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: buttonText
        font.family: "Segoe UI"
        font.pixelSize: 16
        font.weight: Font.Regular
        color: "white"
    }
    
    style: ButtonStyle {
        background: Rectangle {
            smooth: true
            implicitWidth: 150
            implicitHeight: 38
            radius: 5
            color: lucereButton.pressed ? Qt.darker(buttonColor, 1.1) : buttonColor
        }
    }
}
import QtQuick 2.8
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id: lucereButton

    // Define button color property
    property var buttonColor: "#777777"

    // Define button text property
    property alias buttonText: buttonText.text

    Text {
        id: buttonText
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        text: "Lucere Button"
        font.family: "Segoe UI"
        font.pixelSize: 15
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
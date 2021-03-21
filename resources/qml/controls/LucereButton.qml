import QtQuick 2.8
import QtQuick.Controls 2.4

Button {
    id: lucereButton
    implicitWidth: 150
    implicitHeight: 38
    text: qsTr("Lucere Button")

    // Define button color property
    property var buttonColor: "#cccccc"
    property alias buttonText: lucereButton.text

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: lucereButton.text
        font.family: "Segoe UI"
        font.pixelSize: 15
        color: "white"
    }
    
    background: Rectangle {
        smooth: true
        implicitWidth: 150
        implicitHeight: 38
        radius: 5
        color: lucereButton.down ? Qt.darker(buttonColor, 1.1) : buttonColor
    }
}
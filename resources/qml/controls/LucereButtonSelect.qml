import QtQuick 2.8
import QtQuick.Controls 2.8
import "../styles/AppColors.js" as AppColors

RadioButton {
    id: lucereSelectButton
    implicitWidth: 150
    implicitHeight: 38
    text: checked ? qsTr("Selected") : qsTr("Select")

    // Define button color property
    property var buttonColor: "#cccccc"
    property alias buttonText: lucereSelectButton.text

    indicator: Rectangle {
        smooth: true
        anchors.centerIn: parent
        anchors.fill: parent
        radius: 5
        color: lucereSelectButton.checked ? AppColors.darkGray : AppColors.lightGray
    }

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: lucereSelectButton.text
        font.family: "Segoe UI"
        font.pixelSize: 15
        color: "white"
    }
}
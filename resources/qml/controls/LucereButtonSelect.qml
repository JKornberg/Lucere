import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

RadioButton {
    id: lucereSelectButton
    implicitWidth: 100
    implicitHeight: 30
    text: checked ? qsTr("Selected") : qsTr("Select")

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
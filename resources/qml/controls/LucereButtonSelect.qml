import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property alias lucereSelectButton: lucereSelectButton

    id: wrapper
    implicitWidth: 100
    implicitHeight: 30
    color: lucereSelectButton.checked ? AppColors.darkGray : AppColors.lightGray
    radius: 5
    
    RadioButton {
        id: lucereSelectButton
        implicitWidth: 100
        implicitHeight: 30
        indicator: Rectangle {}
        ButtonGroup.group: radioGroup // This group name is defined in ScanGridSelect.qml
    }

    Text {
        anchors.centerIn: parent
        text: lucereSelectButton.checked ? "Selected" : "Select"
        font.family: "Segoe UI"
        font.pixelSize: 15
        color: "white"
    }
}
import QtQuick 2.8
import "../components" as Components
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

    Text {
        x: 20
        y: 10
        text: "SELECT A PAIR SCAN"
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.lightGray
    
    }

    Components.ScanList {
        id: scanList
        y: 40
    }

    Controls.LucereButton {
        x: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        width: 180
        buttonText: "Compare"
        buttonColor: AppColors.red
    }
}
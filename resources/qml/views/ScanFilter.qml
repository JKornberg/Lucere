import QtQuick 2.8
import QtQuick.Controls 2.8
import "../controls" as Controls
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    implicitWidth: 200
    implicitHeight: 480
    color: AppColors.darkGray

    // Title
    Text {
        x: parent.x + 20
        y: parent.y + 10
        text: "SORT & FILTER"
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.borderGray
    }

    // Sort By
    Text {
        x: parent.x + 20
        y: parent.y + 46
        text: "Sort By:"
        font.family: "Segoe UI Semibold"
        font.pixelSize: 16
        color: AppColors.lightGray
    }

    // Sort By Options
    
    ButtonGroup {
        id: radios
        buttons: sortBy.children
    }

    ListView {
        id: sortBy
        width: 162
        height: 110
        x: parent.x + 18
        y: parent.y + 77
        spacing: 10
        
        model: ["Date", "Wavelength", "Number of Scans"]

        delegate : Controls.LucereRadioButton {
            text: modelData
            textColor: "#ffffff"
            rectColor: AppColors.borderGray
            circleColor: AppColors.lightGray
            ButtonGroup.group: radios
        }
    }
}
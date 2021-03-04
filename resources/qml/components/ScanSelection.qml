import QtQuick 2.8
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: wrapper
    implicitWidth: 200
    implicitHeight: 380
    color: AppColors.darkGray
    clip: true

    ListModel {
        id: scanModel
        ListElement {
            scanID: "000006"
            scanDate: "02/02/2021"
            scanWave: "750"
        }
        ListElement {
            scanID: "000006"
            scanDate: "02/02/2021"
            scanWave: "750"
        }
        ListElement {
            scanID: "000006"
            scanDate: "02/02/2021"
            scanWave: "750"
        }
        ListElement {
            scanID: "000006"
            scanDate: "02/02/2021"
            scanWave: "750"
        }
        ListElement {
            scanID: "000006"
            scanDate: "02/02/2021"
            scanWave: "750"
        }
    }

    Component {
        id: scanDelegate
        Row {
            width: wrapper.width
            height: 80

            Column {
                leftPadding: 20
                topPadding: 10
                bottomPadding: 10
                ScanSelectionRow {text: 'ID: ' + scanID}
                ScanSelectionRow {text: 'Date: ' + scanDate}
                ScanSelectionRow {text: 'Wavelength: ' + scanWave + " nm"}
            }

            MouseArea {
                anchors.fill: parent
                onClicked: scanListView.currentIndex = model.index
            }
        }
    }

    ListView {
        id: scanListView
        width: parent.width
        height: parent.height
        
        model: scanModel
        delegate: scanDelegate
        focus: true
        highlightMoveDuration: 300

        highlight: Rectangle {
            anchors {
                left: parent.left
                right: parent.right
            }
            color: AppColors.red
        }
    }
}
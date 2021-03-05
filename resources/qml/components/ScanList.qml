import QtQuick 2.8
import "../components" as Components
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: wrapper
    implicitWidth: 200
    implicitHeight: 380
    color: AppColors.darkGray
    clip: true

    Component {
        id: scanDelegate
        
        Rectangle {
            width: wrapper.width
            height: 80
            color: "transparent"

            Column {
                leftPadding: 20
                topPadding: 10
                bottomPadding: 10

                Text {
                    text: "ID: " + scanID
                    font.family: "Segoe UI"
                    font.pixelSize: 14
                    color: "white"               
                }
                Text {
                    text: 'Date: ' + scanDate
                    font.family: "Segoe UI"
                    font.pixelSize: 14
                    color: "white"               
                }
                Text {
                    text: 'Wavelength: ' + scanWave + " nm"
                    font.family: "Segoe UI"
                    font.pixelSize: 14
                    color: "white"               
                }
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
        
        model: Components.ScanModel {}
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
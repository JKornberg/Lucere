import QtQuick 2.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

Rectangle {
    id: wrapper
    implicitWidth: 690
    implicitHeight: 350
    color: "transparent"
    clip: true

    Rectangle {
        id: captures
        anchors.fill: parent
        color: AppColors.lightGray

        SwipeView {
            id: view

            currentIndex: 0
            anchors.fill: parent

            Repeater {
                id: repeater
                model: analysisModel
                delegate: Image {
                    source: modelData
                    fillMode: Image.PreserveAspectCrop
                    Component.onCompleted: {
                        busyIndicator.running = false
                    }
                }
            }
        }

        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Show progress while loading images
        BusyIndicator {
            id: busyIndicator
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            width: 50
            height: 50
            palette.dark: "white"

            running: true
        }
    }   
}
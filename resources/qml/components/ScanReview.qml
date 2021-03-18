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
        id: cameraWrapper
        anchors.fill: parent
        color: AppColors.lightGray

        SwipeView {
            id: view

            currentIndex: 0
            anchors.fill: parent

            Repeater {
                id: repeater
                model: imageModel
                delegate: Image {
                    source: Qt.resolvedUrl(captureImage)
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
    }   
}
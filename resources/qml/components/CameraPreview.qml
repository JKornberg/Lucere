import QtQuick 2.8
import QtMultimedia 5.8
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

        Camera {
            id: camera

            // Set resolution
            viewfinder.resolution: "1920x1080"

            // Show the preview in an Image
            imageCapture {
                onImageCaptured: {
                    preview.source = preview
                }
            }
        }

        // Receive focus and capture key events when visible
        VideoOutput {
            source: camera
            anchors.fill: parent
            focus : visible

            MouseArea {
                anchors.fill: parent;
                onClicked: camera.imageCapture.capture()
            }
        }

        Image {
            id: preview
            anchors.fill: parent
        }
    }    
}
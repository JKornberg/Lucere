import QtQuick 2.8
import QtMultimedia 5.8
import QtQuick.Controls 2.4
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define property variables (aliases cannot be use as they will generate segmentation fault)
    property real shutterSpeed: 0.0
    property real brightness: 0.0
    property real contrast: 0.0
    property real sharpness: 0.0
    property int iso: 100

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

            // Set Camera Controls
            exposure.manualShutterSpeed: shutterSpeed
            imageProcessing.brightness: brightness
            imageProcessing.contrast: contrast
            imageProcessing.sharpeningLevel: sharpness
            exposure.manualIso: iso

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

        // Show progress while loading images
        BusyIndicator {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            width: 50
            height: 50
            y: 20
            palette.dark: "white"

            running: camera.cameraStatus === Camera.StartingStatus
        }
    }
}
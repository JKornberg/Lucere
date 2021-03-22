import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Capture Page
Components.LucerePage {
    id: newCapturePage
    clip: true

    Components.PageTitle {
        text: "New Capture"
    }

    Components.CameraPreview {
        id: cameraPreview
        x: 20
        y: 60

        // Camera Settings
        shutterSpeed: slider.shutterSpeedValue
        brightness: slider.brightnessValue * 0.01
        contrast: slider.contrastValue * 0.01
        sharpness: slider.sharpnessValue * 0.01
        iso: slider.isoValue

        // Component.onCompleted: {
        //     console.debug(cameraPreview.brightness)
        // }
    }

    Components.InfoLine {
        x: 20
        y: parent.height - 40
        notice: "Use <b>Capture Settings</b> to set specific scan options"
    }

    Controls.LucereDelayButton {
        id: captureButton
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 180
        height: 38
        buttonText: "Start Capture"
        buttonDelay: 2000
        buttonColor: AppColors.purple
    }

    Controls.LucereButton {
        id: scanOptionsButton
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 180
        buttonText: "Capture Settings"
        buttonColor: AppColors.lightGray

        onClicked: {
            slider.x = 530
        }
    }

    // Slider
    Views.CaptureOptions {
        id: slider
    }
}

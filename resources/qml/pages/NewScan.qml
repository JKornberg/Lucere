import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors
import "../models"

StackView {
    // Define custom properties
    property alias shutterSpeed: cameraPreview.shutterSpeed
    property alias duration: slider.scanRunTime
    property alias interval: slider.captureIntervalValue
    property alias count: slider.numberOfScansValue
    property alias brightness: slider.brightnessValue
    property alias contrast: slider.contrastValue
    property alias sharpness: slider.sharpnessValue
    property alias iso: cameraPreview.iso
    property alias resolution: cameraPreview.resolution
    property alias scanTimerComp: scanTimerComponent
    property bool captureTimerComplete: false
    signal captureComplete

    id: newScanStack
    width: 730
    height: 480

    initialItem: newCapturePage

    // Capture Page
    Components.LucerePage {
        id: newCapturePage
        clip: true

        Components.PageTitle {
            text: "New Scan"
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

            camera.imageCapture {
                onImageSaved: {
                    console.log("Imaged saved")
                    captureTimerComplete ? captureComplete() : undefined
                }
            }
        }

        Components.InfoLine {
            id: infoLine
            x: 20
            y: parent.height - 45
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
            onActivated: {
                timeLoader.sourceComponent = scanTimerComponent
                scanOptionsButton.visible = false
                captureButton.visible = false
                cancelButton.visible = true
                infoLine.notice = "Capture in progress. Total number of captures: <b>" + slider.numberOfScansValue + "</b> | Capture Interval: <b>" + slider.captureIntervalValue + "</b>"
            }
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
                sliderMouseArea.visible = true
            }
        }

        Controls.LucereButton {
            id: cancelButton
            x: parent.width - width - 20
            y: parent.height - height - 20
            width: 180
            height: 38
            buttonText: "Cancel Capture"
            buttonColor: AppColors.lightGray
            visible: false

            onClicked: {
                // Unload timer & cleanup
                timeLoader.sourceComponent = undefined
                cancelButton.visible = false
                captureButton.visible = true
                scanOptionsButton.visible = true
                infoLine.notice = "Use <b>Capture Settings</b> to set specific scan options"
            }
        }

        // Slider Close Mouse Area
        Components.SliderMouseArea {
            id: sliderMouseArea
            visible: false
            onClicked: {
                slider.x == 530 ? slider.x = 730 : undefined
                visible = false
            }
        }

        // Slider
        Views.CaptureOptions {
            id: slider
        }

        // Instantiate capture model
        TempCaptureModel {
            id: tempCaptureModel
        }

        Component {
            id: scanTimerComponent

            Components.ScanTimer {
                id: scanTimer
                x: newScanStack.width / 2 - width / 2
                y: newScanStack.height / 2 - height / 2

                // Set counters from slider values
                intervalCounter: slider.captureIntervalValue
                resetIntervalCounter: slider.captureIntervalValue
                captureCount: slider.numberOfScansValue

                // Scan Timer
                Timer {
                    interval: 1000; running: true; repeat: true
                    onTriggered: {
                        if(captureCounter == captureCount && intervalCounter == 0) {
                            cameraPreview.camera.imageCapture.captureToLocation((captureCounter - 1) + '.jpg')
                            dataManager.addTempCaptures(captureCounter - 1)
                            stop()
                            captureTimerComplete = true
                            timerComplete()
                        }
                        else if(intervalCounter == 0) {
                            intervalCounter = resetIntervalCounter
                            cameraPreview.camera.imageCapture.captureToLocation((captureCounter - 1) + '.jpg')
                            dataManager.addTempCaptures(captureCounter - 1)
                            captureCounter += 1
                            restart()
                        }
                        else {
                            intervalCounter -= 1
                        }
                    }
                }

                onTimerComplete: {
                    timeLoader.sourceComponent = undefined
                    cancelButton.visible = false
                    captureButton.visible = true
                    scanOptionsButton.visible = true
                    infoLine.notice = "Use <b>Capture Settings</b> to set specific scan options"
                }
            }
        }

        // Scan Timer
        Loader {
            id: timeLoader
        }
    }

    onCaptureComplete: {
        newScanStack.push("CaptureComplete.qml")
    }
}

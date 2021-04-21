import QtQuick 2.8
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Properties
    property alias header: header
    property alias body: body
    property alias messageBox: messageBox
    property alias messageAnimation: messageAnimation
    property alias yesButtonText: yesButton.text
    property alias noButtonText: noButton.text

    // Signals
    signal noButtonPressed
    signal yesButtonPressed
    
    implicitWidth: 730
    implicitHeight: 480
    color: "transparent"

    Rectangle {
        id: wrapper
        anchors.fill: parent
        color: AppColors.darkGray
        opacity: 0.8
    }

    Rectangle {
        id: messageBox
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        width: 220
        height: 160
        radius: 10
        y: 480
        color: "white"

        Behavior on y {
            NumberAnimation {
                id: messageAnimation
                duration: 620
                easing.type: Easing.OutBack
            }
        }

        // Confirmation title
        Rectangle {
            width: 200
            height: 20
            y: 15
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                source: "../../icons/warning.svg"
                x: 5

                Text {
                    id: header
                    anchors.verticalCenter: parent.verticalCenter
                    x: parent.width + 10
                    text: ""
                    font.family: "Segoe UI Semibold"
                    font.pixelSize: 16
                    color: AppColors.darkGray
                }
            }
        }

        // Confirmation body
        Rectangle {
            width: 190
            height: 60
            y: 40
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: body
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                text: ""
                wrapMode: Text.Wrap
                font.family: "Segoe UI"
                font.pixelSize: 14
                color: AppColors.lightGray
            }
        }

        // Confirmation Buttons
        Rectangle {
            width: 220
            height: 50
            anchors.bottom: parent.bottom
            color: AppColors.borderGray
            radius: 10

            Controls.LucereButton {
                id: noButton
                anchors.verticalCenter: parent.verticalCenter
                width: 95
                height: 30
                x: 10
                buttonText: "No"
                buttonColor: AppColors.lightGray

                onClicked: {
                    noButtonPressed()
                }
            }

            Controls.LucereButton {
                id: yesButton
                anchors.verticalCenter: parent.verticalCenter
                width: 95
                height: 30
                x: noButton.width + 20
                buttonText: "Yes"
                buttonColor: AppColors.red

                onClicked: {
                    yesButtonPressed()
                }
            }
        }

        Component.onCompleted: {
            y = wrapper.height / 2 - height / 2
        }
    }
}
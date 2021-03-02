import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import "../styles/Functions.js" as Functions

DelayButton {
    id: lucereDelayButton
    
    // Define button color property
    property var buttonColor: "#CCCCCC"

    // Define button text property
    property var buttonText: "Delay Button"

    // Define button delay property
    property var buttonDelay: 4000

    delay: buttonDelay

    contentItem: Text {
        text: buttonText
        font.family: "Segoe UI"
        font.pixelSize: 15
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        id: rectDelay
        implicitWidth: 80
        implicitHeight: 30
        color: buttonColor
        radius: 5

        Canvas {
            id: canvas
            anchors.fill: parent
            clip: true

            Connections {
                target: lucereDelayButton
                onProgressChanged: canvas.requestPaint()
            }

            onPaint: {
                // Construct round rectangle and clip
                var ctx = getContext("2d")
                var rectWidth = lucereDelayButton.progress * rectDelay.width

                Functions.roundRect(ctx, 0, 0, rectDelay.width, rectDelay.height, 10);
                ctx.clip()

                ctx.clearRect(0, 0, rectDelay.width, rectDelay.height)
                ctx.fillStyle = Qt.darker(buttonColor, 1.1) 
                ctx.fillRect(0, 0, rectWidth, rectDelay.height)
            }
        }
    }
}
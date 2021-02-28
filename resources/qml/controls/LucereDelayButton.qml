import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

DelayButton {
    id: lucereDelayButton
    
    // Define button color property
    property var buttonColor: "#CCCCCC"

    // Define button text property
    property var buttonText: "Delay Button"

    // Define button delay property
    property var buttonDelay: 2000

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
        color: lucereDelayButton.down ? Qt.darker(buttonColor, 1.1) : buttonColor
        radius: 5

        Canvas {
            id: canvas
            anchors.fill: parent

            Connections {
                target: lucereDelayButton
                onProgressChanged: canvas.requestPaint()
            }

            onPaint: {
                // Rectangle variables
                var ctx = getContext("2d")
                var rectWidth = lucereDelayButton.progress * rectDelay.width
                var rectRadius = 5

                ctx.clearRect(0, 0, rectDelay.width, rectDelay.height)
                ctx.fillStyle = Qt.darker(buttonColor, 1.2) 
                ctx.fillRect(0, 0, rectWidth, rectDelay.height)
            }
        }
    }
}
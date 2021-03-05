import QtQuick 2.8

Rectangle {
    // Define properties
    property var title: "Title:"
    property var detail: "text"

    width: parent.width
    height: 10
    color: "transparent"

    Text {
        anchors.fill: parent
        text: (title + " " + detail)
        font.family: "Segoe UI"
        font.pixelSize: 12
        color: "white"
    }
}
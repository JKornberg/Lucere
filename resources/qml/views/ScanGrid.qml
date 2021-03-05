import QtQuick 2.8
import QtQml.Models 2.8
import "../components" as Components

Rectangle {
    implicitWidth: 700
    implicitHeight: 348

    GridView {
        id: scanGridView
        anchors.fill: parent
        cellWidth: 233
        cellHeight: 180

        model: Components.ScanModel {}
        delegate: Item {
            ScanItem {}
        }
    }
}
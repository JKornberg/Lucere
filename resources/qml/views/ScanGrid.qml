import QtQuick 2.8
import QtQuick.Controls 2.8
import "../components" as Components
import "../controls" as Controls

Rectangle {
    implicitWidth: 700
    implicitHeight: 348

    ButtonGroup {
        id: buttonGroup
    }

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
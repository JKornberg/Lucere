import QtQuick 2.8

ListModel {
    id: captureModel
    ListElement {
        scanCount: 10
        captureInterval: 20
        shutterSpeed: 5000
        brightness: 63
        contrast: -20
        sharpness: 10
        iso: 100
    }
}
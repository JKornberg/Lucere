import QtQuick 2.8

ListModel {
    id: analysisModel
    ListElement {
        name: "blob"
        iconUrl: "../../icons/analysis-blob.svg"
        title: "Blob Detection"
        description: "Runs three algorithms bright on dark or dark on bright regions in an image."
    }
    ListElement {
        name: "dog"
        iconUrl: "../../icons/analysis-gaussians.svg"
        title: "Diff. of Blobs"
        description: "Used to denoise images while at the same time reducing low-frequency artifacts such a uneven illumination."
    }
    ListElement {
        name: "rgb2hsv"
        iconUrl: "../../icons/analysis-checkerboard.svg"
        title: "RGB to HSV"
        description: "illustrates how RGB to HSV (Hue, Saturation, Value) can be used to facilitate segmentation processes."
    }
    ListElement {
        name: "ridge"
        iconUrl: "../../icons/analysis-segmentfinding.svg"
        title: "Ridge Find"
        description: "Solves a regression model where the loss function is the linear least squares function"
    }
    ListElement {
        name: "segmentation"
        iconUrl: "../../icons/analysis-contour.svg"
        title: "Segmentation"
        description: "Construct a region boundary RAG and returns average value of coresponding pixels."
    }
}
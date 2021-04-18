import QtQuick 2.8

ListModel {
    id: analysisModel
    ListElement {
        iconUrl: "../../icons/analysis-blob.svg"
        title: "Blob Detection"
        description: "Runs three algorithms bright on dark or dark on bright regions in an image."
    }
    ListElement {
        iconUrl: "../../icons/analysis-gaussians.svg"
        title: "Diff. of Gaussians"
        description: "Used to denoise images while at the same time reducing low-frequency artifacts such a uneven illumination."
    }
    ListElement {
        iconUrl: "../../icons/analysis-checkerboard.svg"
        title: "Checkerboard"
        description: "Identify and/or change adjacent values in an image based on their similarity to an initial seed point."
    }
    ListElement {
        iconUrl: "../../icons/analysis-segmentfinding.svg"
        title: "Segment Finding"
        description: "Runs segmentation algorithm over a raw image to detect and count nuclei."
    }
    ListElement {
        iconUrl: "../../icons/analysis-contour.svg"
        title: "Contour Finding"
        description: "Uses a marching squares method to find constant valued contours in an image."
    }
    ListElement {
        iconUrl: "../../icons/analysis-localmaxima.svg"
        title: "Local Maxima"
        description: "Detect local maxima in a scanned image. Generated based on noise level."
    }
}
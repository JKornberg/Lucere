import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    implicitWidth: 730
    implicitHeight: 480
    color: AppColors.backgroundGray

    Rectangle {
        x: 10
        y: 10
        width: 710
        height: 460
        radius: 5
        color: "white"
        border.width: 1
        border.color: AppColors.borderGray
    }
}
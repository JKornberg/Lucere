import QtQuick 2.13
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define separator color
    property var separatorColor: "#000000"

    implicitWidth: 590
    implicitHeight: 1
    color: separatorColor
    border.color: separatorColor
}
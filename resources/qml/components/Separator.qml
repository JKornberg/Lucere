import QtQuick 2.8
import "../styles/AppColors.js" as AppColors

Rectangle {
    // Define separator color
    property string separatorColor: "#000000"

    implicitWidth: 590
    implicitHeight: 1
    color: separatorColor
    border.color: separatorColor
}
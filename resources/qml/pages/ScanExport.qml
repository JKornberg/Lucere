import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

StackView {
    // Signals
    signal scanSelected

    id: wrapper
    width: 730
    height: 480

    Components.LucerePage {
        id: scanExportPage
        clip: true

        Components.PageTitle {
            text: "Scan Export"
        }

        Views.ScanGridSelect {
            id: scanSelect

            // Set data model
            scanGridSelect.model: scanModel
            
            onSelectButtonPressed: {
                // Present list of scans
            }
            x: 20
            y: 60
        }

        Components.InfoLine {
            x: 20
            y: parent.height - 40
            notice: "Select the <b>scan</b> you wish to export."
        }

        Controls.LucereButton {
            x: parent.width - width - 20
            y: parent.height - height - 20
            width: 220
            buttonText: "Export Selected Scan"
            buttonColor: AppColors.purple

            onClicked: {
                scanSelected()
            }
        }
    }
}
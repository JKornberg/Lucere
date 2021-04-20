import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../dialogs" as Dialogs
import "../styles/AppColors.js" as AppColors

StackView {
    // Signals
    signal scanSelected

    property alias scanGridSelect: scanSelect.scanGridSelect
    property int exportScanIndex: 0
    property int exportId: 0

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
            x: 20
            y: 60

            onSelectButtonPressed : {
                exportId = scanModel.get(scanIdGridIndex)["id"]
                exportScanIndex = scanIdGridIndex
            }
        }

        Components.InfoLine {
            x: 20
            y: parent.height - 45
            notice: "Select the <b>scan</b> you wish to export."
        }

        Controls.LucereButton {
            x: parent.width - width - 20
            y: parent.height - height - 20
            width: 220
            buttonText: "Export Selected Scan"
            buttonColor: AppColors.purple
            signal exportButtonClicked

            onClicked: {
                scanSelected()
                confirmationLoader.sourceComponent = confirmationComponent
            }
        }
    }

    // Confirmation Message
    Component {
        id: confirmationComponent

        Dialogs.Confirmation {
            header.text: "Action Required"
            body.text: "Are you sure you want to export <b>scan  " + exportId + "</b>?"

            onNoButtonPressed: {
                confirmationLoader.sourceComponent = undefined
            }

            onYesButtonPressed: {
                scanModel.exportScan(exportScanIndex)
                confirmationLoader.sourceComponent = undefined
            }
        }
    }

    // Confirmation Message Loader
    Loader {
        id: confirmationLoader
    }
}
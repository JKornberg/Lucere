import QtQuick 2.8
import "../components" as Components
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors
import "../views" as Views

Components.LucereWindow {
    Components.LucerePage {
        Views.ScanFilter {
            x: 600
        }
    }

    Views.MainMenu {

    }
}
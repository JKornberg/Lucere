import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.8
import QtQuick.Controls.Styles 1.4
import "../components"
import "../controls"
import "../styles/AppColors.js" as AppColors

LucereWindow {
    // Left Sidebar
    MainMenu {
        id: sidebar
        anchors.left: parent.left
        anchors.leftMargin: 0
    }

    // Login Page
    LucerePage {
        id: loginPage
        anchors.left: parent.left
        anchors.leftMargin: 70

        // Logo Image
        Image {
            id: lucereLogo
            x: 315
            y: 80
            width: 150
            height: 45
            source: "../../img/lucere_logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Line Separator
        Separator {
            id: line
            x: 70
            y: 428
            separatorColor: AppColors.borderGray
        }

        // Welcome Text
        Text {
            id: welcome
            x: 315
            y: 163
            height: 32
            color: AppColors.lightGray
            text: "Welcome"
            font.family: "Segoe UI"
            font.weight: Font.Light
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Date
        Text {
            id: date
            x: 318
            y: 204
            height: 16
            color: AppColors.lightGray
            text: new Date().toLocaleDateString(Qt.locale(), "MMMM d, yyyy")
            font.family: "Segoe UI"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Name Label
        Text {
            id: name
            x: 213
            y: 258
            width: 30
            height: 16
            text: "Name"
            font.family: "Segoe UI"
            font.weight: Font.Light
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
        }

        // PIN Label
        Text {
            id: pin
            x: 452
            y: 258
            height: 16
            text: "PIN"
            font.family: "Segoe UI"
            font.weight: Font.Light
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenters
        }

        // Select User ComboBox
        LucereComboBox {
            id: nameSelect
            x: 208
            y: 279

            placeholderText: "Select User..."
            placeholderColor: AppColors.lightGray
            optionColor: AppColors.lightGray
            borderColor: AppColors.borderGray
            contents: ["Atticus Steinmetz", "Sadie Crawford"]
        }

        // PIN Text Input Field
        LucerePasswordField {
            id: pinTxtField
            x: 447
            y: 279
            placeholderText: "******"
            color: AppColors.lightGray
            borderColor: AppColors.borderGray
        }

        // Exit Button
        LucereButton {
            id: exitBtn
            x: 208
            y: 336
            buttonColor: AppColors.lightGray
            buttonText: "Exit"
        }

        // Login Button
        LucereButton {
            id: loginBtn
            x: 373
            y: 336
            buttonColor: AppColors.purple
            buttonText: "Login"
        }

        // App Title and Version
        Text {
            id: version
            x: 296
            y: 438
            height: 16
            color: AppColors.lightGray
            text: "LucereLabs Analysis v1.0.0"
            font.family: "Segoe UI"
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.8
import "../components"
import "../controls"
import "../styles/AppColors.js" as AppColors

// Lucere Login Page
LucerePage {
    id: loginPage

    // Logo Image
    Image {
        id: lucereLogo
        anchors {
            horizontalCenter: loginPage.horizontalCenter
        }
        y: loginPage.y + 80

        source: "../../img/lucere-logo.png"
    }

    // Welcome Text
    Text {
        id: welcome
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter
        height: 32
        text: "Welcome"
        font.family: "Segoe UI"
        font.weight: Font.Light
        font.pixelSize: 24
        color: AppColors.lightGray
    }

    // Date
    Text {
        id: date
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        height: 16
        color: AppColors.lightGray
        text: new Date().toLocaleDateString(Qt.locale(), "MMMM d, yyyy")
        font.family: "Segoe UI"
        font.pixelSize: 12
    }

    Rectangle {
        width: 310
        height: 108
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: date.y + date.height + 60

        // Name Label
        Text {
            id: name
            x: 5
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
            x: nameSelect.width + 15
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
            y:name.height + 5
            placeholderText: "Select User..."
            placeholderColor: AppColors.lightGray
            optionColor: AppColors.lightGray
            borderColor: AppColors.borderGray
            contents: ["Atticus Steinmetz", "Sadie Crawford"]
        }

        // PIN Text Input Field
        LucerePasswordField {
            id: pinTxtField
            x: nameSelect.width + 10
            y: name.height + 5
            placeholderText: "******"
            color: AppColors.lightGray
            borderColor: AppColors.borderGray
        }

        // Exit Button
        LucereButton {
            id: exitBtn
            y: nameSelect.y + nameSelect.height + 10
            buttonColor: AppColors.lightGray
            buttonText: "Exit"
        }

        // Login Button
        LucereButton {
            id: loginBtn
            x: exitBtn.width + 10
            y: nameSelect.y + nameSelect.height + 10
            buttonColor: AppColors.purple
            buttonText: "Login"
        }
    }

    // App Title and Version
    Text {
        id: version
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.height - 40
        height: 16
        color: AppColors.lightGray
        text: "LucereLabs Analysis v1.0.0 Alpha"
        font.family: "Segoe UI"
        font.pixelSize: 12
    }

    // Line Separator
    Separator {
        id: line
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: version.y - 10
        separatorColor: AppColors.borderGray
    }
}
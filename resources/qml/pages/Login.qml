import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../styles/AppColors.js" as AppColors

// Lucere Login Page
Components.LucerePage {
    // Signals
    signal loginButtonPressed
    signal exitButtonPressed

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
        y: date.y + date.height + 77

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
        Components.LucereComboBox {
            id: nameSelect
            y: name.height + 5
            placeholderText: "Select User..."
            placeholderColor: AppColors.lightGray
            optionColor: AppColors.lightGray
            borderColor: AppColors.borderGray
            model: userNames
        }

        // PIN Text Input Field
        Components.LucerePasswordField {
            id: pinTxtField
            x: nameSelect.width + 10
            y: name.height + 5
            placeholderText: "******"
            color: AppColors.lightGray
            borderColor: AppColors.borderGray
        }

        // Exit Button
        Controls.LucereButton {
            id: exitButton
            y: nameSelect.y + nameSelect.height + 10
            buttonColor: AppColors.lightGray
            buttonText: "Exit"
            onClicked: {
                exitButtonPressed()
            }
        }

        // Login Button
        Controls.LucereButton {
            id: loginButton
            x: exitButton.width + 10
            y: nameSelect.y + nameSelect.height + 10
            buttonColor: AppColors.purple
            buttonText: "Login"
            onClicked: {
                if (dataManager.AuthenticateUser(nameSelect.currentText, pinTxtField.text)) {
                    mainWindow.userId = dataManager.FetchUserId(name);
                    mainWindow.userName = nameSelect.currentText;
                    loginButtonPressed();
                } else {
                    console.log("Placeholder: Failed Login"); // TODO: Dialog popup
                }
            }
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
    Components.Separator {
        id: line
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: version.y - 10
        separatorColor: AppColors.borderGray
    }
}
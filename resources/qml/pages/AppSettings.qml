import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Admin Settings Page
Components.LucerePage {
    // Properties
    property bool admin: false

    id: captureSettingsPage
    clip: true
    
    // Visibility Container
    Rectangle {
        // Admin Settings Page Title
        Components.PageTitle {
            text: "Admin Settings"
        }

        // Data Management Section
        Rectangle {
            x: parent.x + 20
            y: parent.y + 60
            width: 340
            height: 230
            enabled: admin

            // Data Management Sub Title
            Components.SubTitle {
                svg: "data-management.svg"
                text: "Data Management"
                x: 15
                y: 15
            }

            // Data Management Description
            Text {
                x: 11
                y: 39
                text: "Database Backup & Restore"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            // Data Backup Title
            Text {
                x: 11
                y: 72
                text: "Database Backup"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // New Backup Button
            Controls.LucereButton {
                id: newBackupButton
                x: 11
                y: 97
                width: 155
                height: 38
                buttonText: "New Backup"
                buttonColor: AppColors.darkGray
            }

            // Data Restore Title
            Text {
                x: 11
                y: 143
                text: "Database Restore"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Data Restore Button
            Controls.LucereButton {
                id: restoreButton
                x: 11
                y: 168
                width: 155
                height: 38
                buttonText: "Restore"
                buttonColor: AppColors.darkGray
            }

            // Auto-Backup Title
            Text {
                x: 254
                y: 14
                text: "Auto-Backup?"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Auto-Backup Button
            Switch {
                id: autoBackupButton
                x: 287
                y: 38
                width: 36
                height: 14

                // Switch Indicator
                indicator: Rectangle {
                    width: 36
                    height: 14
                    radius: 11
                    color: autoBackupButton.checked ? AppColors.darkGray : AppColors.borderGray

                    Rectangle {
                        width: 20
                        height: 20
                        x: autoBackupButton.checked ? 0 : parent.width - 20
                        y: parent.height / 2.0 - 10
                        radius: 11
                        color: AppColors.lightGray
                    }
                }
            }
        }
        
        // App Reset Section
        Rectangle {
            x: parent.x + 20
            y: parent.y + 300
            width: 340
            height: 110
            enabled: admin

            // App Reset Sub Title
            Components.SubTitle {
                svg: "app-reset.svg"
                text: "App Reset"
                x: 15
                y: 15
            }

            // Warning Description
            Text {
                x: 9
                y: 40
                width: 320
                height: 52
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
                wrapMode: Text.WordWrap
                text: "<b>Warning!</b> This option create a new database and purges all existing data. Please ensure you create a database backup first. Stored scan images are <b>not</b> removed in this process!"
            }

            // Purge Button
            Controls.LucereDelayButton {
                id: purgeButton
                y: 120
                width: 165
                height: 36
                buttonColor: AppColors.red
                buttonText: "Purge & Reset"
                buttonDelay: 20000
            }
        }

        // User Management Section
        Rectangle {
            x: parent.x + 350
            y: parent.y + 60
            width: 340
            height: 350
            enabled: admin

            // User Management Sub Title
            Components.SubTitle {
                svg: "user-management.svg"
                text: "User Management"
                x: 15
                y: 15
            }

            // User Management Description
            Text {
                x: 12
                y: 39
                text: "Add & Remove users. Setup & Update PINs"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.lightGray
            }

            // Edit-Mode Tile
            Text {
                x: 273
                y: 14
                text: "Edit Mode?"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Edit-Mode Button
            Switch {
                id: editModeButton
                x: 294
                y: 38
                width: 36
                height: 14

                // Switch Indicator
                indicator: Rectangle {
                    width: 36
                    height: 14
                    radius: 11
                    color: editModeButton.checked ? AppColors.darkGray : AppColors.borderGray

                    Rectangle {
                        width: 20
                        height: 20
                        x: editModeButton.checked ? 0 : parent.width - 20
                        y: parent.height / 2.0 - 10
                        radius: 11
                        color: AppColors.lightGray
                    }
                }
            }

            // Existing User Select Description
            Text {
                x: 11
                y: 72
                text: "Select Existing User"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Existing User Select Button
            Components.LucereComboBox {
                id: userSelect
                x: 10
                y: 96
                width: 320
                height: 37
                placeholderText: "Select User..."
                placeholderColor: AppColors.lightGray
                optionColor: AppColors.lightGray
                borderColor: AppColors.borderGray
                contents: ["Atticus Steinmetz", "Sadie Crawford"]
            }

            // Edit/New User Select Description
            Text {
                x: 11
                y: 143
                text: "Edit / New User"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Edit/New User Text Field
            TextField {
                id: editField
                x: 10
                y: 167
                width: 320
                height: 37
                placeholderText: "Enter User"
                font.family: "Segoe UI"
                font.pixelSize: 16
                placeholderTextColor: AppColors.lightGray
                color: AppColors.lightGray

                background: Rectangle {
                    color: "white"
                    radius: 5
                    border.color: AppColors.borderGray               
                }
            }
            
            // User Role Select Description
            Text {
                x: 11
                y: 214
                text: "User Role"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // User Role Select Button
            Components.LucereComboBox {
                id: userRoleSelect
                x: 10
                y: 238
                width: 320
                height: 37
                placeholderText: "Select User Role..."
                placeholderColor: AppColors.lightGray
                optionColor: AppColors.lightGray
                borderColor: AppColors.borderGray
                contents: ["Administrator", "Technician"]
            }

            // PIN Title
            Text {
                x: 11
                y: 285
                text: "PIN"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }
            
            // PIN Password Field
            Components.LucerePasswordField {
                id: pin
                x: 10
                y: 303
                placeholderText: "******"
                color: AppColors.lightGray
                borderColor: AppColors.borderGray
            }

            // Confim PIN Title
            Text {
                x: 121
                y: 285
                text: "Confirm PIN"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // PIN Password Field
            Components.LucerePasswordField {
                id: pinConfirm
                x: 131
                y: 303
                placeholderText: "******"
                color: AppColors.lightGray
                borderColor: AppColors.borderGray
            }

            // Locked Title
            Text {
                x: 285
                y: 285
                text: "Locked?"
                font.family: "Segoe UI Light"
                font.pixelSize: 12
                color: AppColors.darkGray
            }

            // Locked Button
            Switch {
                id: lockedButton
                x: 286
                y: 318
                width: 36
                height: 14

                // Switch Indicator
                indicator: Rectangle {
                    width: 36
                    height: 14
                    radius: 11
                    color: lockedButton.checked ? AppColors.darkGray : AppColors.borderGray

                    Rectangle {
                        width: 20
                        height: 20
                        x: lockedButton.checked ? 0 : parent.width - 20
                        y: parent.height / 2.0 - 10
                        radius: 11
                        color: AppColors.lightGray
                    }
                }
            }
        }

        // Delete User Button
        Controls.LucereDelayButton {
            id: deleteUserButton
            x: 350
            y: 420
            width: 165
            height: 36
            buttonColor: AppColors.red
            buttonText: "Delete User"
            buttonDelay: 5000
            enabled: admin
        }

        // Save User Button
        Controls.LucereButton {
            id: saveUserButton
            x: 525
            y: 420
            width: 165
            height: 36
            buttonColor: AppColors.darkGray
            buttonText: "Save"
        }
    }
}
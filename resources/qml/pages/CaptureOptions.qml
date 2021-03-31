import QtQuick 2.8
import QtQuick.Window 2.8
import QtQuick.Controls 2.4
import "../components" as Components
import "../controls" as Controls
import "../views" as Views
import "../styles/AppColors.js" as AppColors

// Capture Settings Page
Components.LucerePage {
    id: captureSettingsPage
    clip: true

    // Capture Settings Page Title
    Components.PageTitle {
        text: "Capture Settings"
    }

    // Camera Settings Sub Title
    Components.SubTitle {
        svg: "camera.svg"
        text: "Camera Settings"
        x: parent.x + 30
        y: parent.y + 69
    }

    // Brightness
    Controls.SettingPageSlider {
        id: brightness
        x: parent.x + 30
        y: parent.y + 110
        sliderTitle: "Brightness"
        svg: "brightness.svg"
        value: 50
        from: 0
        to: 100
    }

    // Contrast
    Controls.SettingPageSlider {
        id: contrast
        x: parent.x + 30
        y: parent.y + 169
        sliderTitle: "Contrast"
        svg: "contrast.svg"
        value: 0
        from: -100
        to: 100
    }

    // Sharpness
    Controls.SettingPageSlider {
        id: sharpness
        x: parent.x + 30
        y: parent.y + 238
        sliderTitle: "Sharpness"
        svg: "sharpness.svg"
        value: 0
        from: -100
        to: 100
    }

    // ISO
    Controls.SettingPageSlider {
        id: iso
        x: parent.x + 30
        y: parent.y + 301
        sliderTitle: "ISO"
        svg: "iso.svg"
        value: 10
        from: 0
        to: 800
        stepSize: 10
    }

    // Shutter Speed
    Controls.SettingPageSlider {
        id: shutterSpeed
        x: parent.x + 380
        y: parent.y + 110
        sliderTitle: "Shutter Speed"
        svg: "shutter-speed.svg"
        value: 5000
        from: 0
        to: 5000
        stepSize: 100
    }

    // Default Resolution
    Components.SettingTitle {
        id: resolutionTitle
        x: parent.x + 380
        y: parent.y + 174
        text: "Default Resolution"
        svg: "resolution.svg"
    }

    // Resolution Combo Box
    Components.LucereComboBox {
        id: resolutionSelect
        x: parent.x + 380
        y: parent.y + 210
        width: 319
        height: 38
        placeholderText: "1920 x 1080"
        placeholderColor: AppColors.lightGray
        optionColor: AppColors.lightGray
        borderColor: AppColors.borderGray
        contents: ["1920 x 1080", "1280 x 720", "720 x 480"]
    }

    // Load Defaults Button
    Controls.LucereButton {
        x: parent.width - width * 2 - 30
        y: parent.height - height - 20
        width: 165
        buttonText: "Load Defaults"
        buttonColor: AppColors.purple
    }

    // Save Button
    Controls.LucereButton {
        x: parent.width - width - 20
        y: parent.height - height - 20
        width: 165
        buttonText: "Save"
        buttonColor: AppColors.darkGray
    }
}
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 10
        sourceSize: Qt.size(430, 300)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/17.jpg"
        smooth: true
    }

    Column {
        id: column
        anchors.left: sourceImage.right
        anchors.leftMargin: 20
        anchors.verticalCenter: sourceImage.verticalCenter
        spacing: 20

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "亮度: "
            }

            SpinBox {
                id: spinbox_brightness
                minimumValue: -1
                maximumValue: 1
                decimals: 2
                stepSize: 0.05
                value: 0
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "对比度: "
            }

            SpinBox {
                id: spinbox_contrast
                minimumValue: -1
                maximumValue: 1
                decimals: 2
                stepSize: 0.05
                value: 0
            }
        }
    }

    BrightnessContrast {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        brightness: spinbox_brightness.value
        contrast: spinbox_contrast.value
    }
}

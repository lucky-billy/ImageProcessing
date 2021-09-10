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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/107.jpg"
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
                text: "色调值: "
            }

            SpinBox {
                id: spinbox_hue
                minimumValue: 0
                maximumValue: 1
                decimals: 1
                stepSize: 0.1
                value: 0
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "亮度值: "
            }

            SpinBox {
                id: spinbox_lightness
                minimumValue: -1
                maximumValue: 1
                decimals: 1
                stepSize: 0.1
                value: 0
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "饱和度: "
            }

            SpinBox {
                id: spinbox_saturation
                minimumValue: 0
                maximumValue: 1
                decimals: 1
                stepSize: 0.1
                value: 1
            }
        }
    }

    Colorize {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        hue: spinbox_hue.value
        lightness: spinbox_lightness.value
        saturation: spinbox_saturation.value
    }
}

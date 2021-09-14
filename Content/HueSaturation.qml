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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/27.jpg"
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
                text: "色调: "
            }

            SpinBox {
                id: spinbox_hue
                minimumValue: -1
                maximumValue: 1
                decimals: 2
                stepSize: 0.1
                value: -0.1
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "亮度: "
            }

            SpinBox {
                id: spinbox_saturation
                minimumValue: -1
                maximumValue: 1
                decimals: 2
                stepSize: 0.1
                value: 0.1
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "饱和: "
            }

            SpinBox {
                id: spinbox_lightness
                minimumValue: -1
                maximumValue: 1
                decimals: 2
                stepSize: 0.1
                value: -0.1
            }
        }
    }

    HueSaturation {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage

        hue: spinbox_hue.value
        saturation: spinbox_saturation.value
        lightness: spinbox_lightness.value
    }
}

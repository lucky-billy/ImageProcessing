import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 10
        sourceSize: Qt.size(640, 360)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/30.jpg"
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
                text: "偏离权重: "
            }

            SpinBox {
                id: spinbox_deviation
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.1
                value: 1
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "半径: "
            }

            SpinBox {
                id: spinbox_radius
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.1
                value: spinbox_samples.value / 2
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "采样数: "
            }

            SpinBox {
                id: spinbox_samples
                minimumValue: 0
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 16
            }
        }
    }

    GaussianBlur {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        deviation: spinbox_deviation.value
        radius: spinbox_radius.value
        samples: spinbox_samples.value
    }
}

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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/4.jpg"
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
                text: "模糊的方向: "
            }

            SpinBox {
                id: spinbox_angle
                minimumValue: 0
                maximumValue: 180
                decimals: 0
                stepSize: 1
                value: 0
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "感知移动量: "
            }

            SpinBox {
                id: spinbox_length
                minimumValue: 0
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 10
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
                value: 5
            }
        }
    }

    DirectionalBlur {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        angle: spinbox_angle.value
        length: spinbox_length.value
        samples: spinbox_samples.value
    }
}

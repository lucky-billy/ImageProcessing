import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 30
        sourceSize: Qt.size(430, 300)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/59.jpg"
        smooth: true
    }

    Column {
        id: column
        anchors.left: sourceImage.right
        anchors.leftMargin: 20
        anchors.verticalCenter: sourceImage.verticalCenter
        spacing: 10

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "角度: "
            }

            SpinBox {
                id: spinbox_angle
                minimumValue: 0
                maximumValue: 360
                decimals: 2
                stepSize: 0.1
                value: 5
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
                minimumValue: 1
                maximumValue: 999
                decimals: 0
                stepSize: 1
                value: 24
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "水平偏移: "
            }

            SpinBox {
                id: spinbox_horizontalOffset
                minimumValue: -9999
                maximumValue: 9999
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
                text: "垂直偏移: "
            }

            SpinBox {
                id: spinbox_verticalOffset
                minimumValue: -9999
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 20
            }
        }
    }

    RadialBlur {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 40
        source: sourceImage

        angle: spinbox_angle.value
        samples: spinbox_samples.value
        horizontalOffset: spinbox_horizontalOffset.value
        verticalOffset: spinbox_verticalOffset.value
    }
}

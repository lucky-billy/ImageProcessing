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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/94.jpg"
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
                text: "感知移动量: "
            }

            SpinBox {
                id: spinbox_length
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.1
                value: 32
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
                value: 0
            }
        }
    }

    ZoomBlur {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage

        length: spinbox_length.value
        samples: spinbox_samples.value
        horizontalOffset: spinbox_horizontalOffset.value
        verticalOffset: spinbox_verticalOffset.value
    }
}

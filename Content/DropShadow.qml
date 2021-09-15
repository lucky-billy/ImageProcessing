import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 30
        sourceSize: Qt.size(510, 256)
        source: "qrc:/Image/material/11.png"
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
                text: "半径: "
            }

            SpinBox {
                id: spinbox_radius
                minimumValue: 1
                maximumValue: 99
                decimals: 0
                stepSize: 1
                value: 8
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
                value: 17
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "增强程度: "
            }

            SpinBox {
                id: spinbox_spread
                minimumValue: 0
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

    DropShadow {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 40
        source: sourceImage

        color: "#0000ff"
        radius: spinbox_radius.value
        samples: spinbox_samples.value
        spread: spinbox_spread.value
        horizontalOffset: spinbox_horizontalOffset.value
        verticalOffset: spinbox_verticalOffset.value
    }
}

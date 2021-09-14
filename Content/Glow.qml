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
        source: "qrc:/Image/material/19.png"
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
                text: "增强程度: "
            }

            SpinBox {
                id: spinbox_spread
                minimumValue: 0
                maximumValue: 1
                decimals: 2
                stepSize: 0.05
                value: 0.2
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
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.1
                value: 17
            }
        }
    }

    Glow {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage

        color: "#aa00ff00"
        spread: spinbox_spread.value
        radius: spinbox_radius.value
        samples: spinbox_samples.value
    }
}

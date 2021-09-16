import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 30
        sourceSize: Qt.size(256, 256)
        source: "qrc:/Image/material/26.png"
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
                value: 0
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "水平半径: "
            }

            SpinBox {
                id: spinbox_horizontalRadius
                minimumValue: -9999
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 50
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "垂直半径: "
            }

            SpinBox {
                id: spinbox_verticalRadius
                minimumValue: -9999
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 50
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

    RadialGradient {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 40
        source: sourceImage

        angle: spinbox_angle.value
        horizontalRadius: spinbox_horizontalRadius.value
        verticalRadius: spinbox_verticalRadius.value
        horizontalOffset: spinbox_horizontalOffset.value
        verticalOffset: spinbox_verticalOffset.value

        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.5; color: "black" }
        }
    }
}

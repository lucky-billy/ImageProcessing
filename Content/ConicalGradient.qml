import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 30
        sourceSize: Qt.size(402, 256)
        source: "qrc:/Image/material/14.png"
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
                text: "起始角度: "
            }

            SpinBox {
                id: spinbox_angle
                minimumValue: -360
                maximumValue: 360
                decimals: 0
                stepSize: 1
                value: 45
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
                minimumValue: sourceImage.width/2*(-1)
                maximumValue: sourceImage.width/2
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
                minimumValue: sourceImage.height/2*(-1)
                maximumValue: sourceImage.height/2
                decimals: 0
                stepSize: 1
                value: 0
            }
        }
    }

    ConicalGradient {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        angle: spinbox_angle.value
        horizontalOffset: spinbox_horizontalOffset.value
        verticalOffset: spinbox_verticalOffset.value

        Gradient {
            GradientStop {
                position: 0.000
                color: Qt.rgba(1, 0, 0, 1)
            }
            GradientStop {
                position: 0.167
                color: Qt.rgba(1, 1, 0, 1)
            }
            GradientStop {
                position: 0.333
                color: Qt.rgba(0, 1, 0, 1)
            }
            GradientStop {
                position: 0.500
                color: Qt.rgba(0, 1, 1, 1)
            }
            GradientStop {
                position: 0.667
                color: Qt.rgba(0, 0, 1, 1)
            }
            GradientStop {
                position: 0.833
                color: Qt.rgba(1, 0, 1, 1)
            }
            GradientStop {
                position: 1.000
                color: Qt.rgba(1, 0, 0, 1)
            }
        }
    }
}

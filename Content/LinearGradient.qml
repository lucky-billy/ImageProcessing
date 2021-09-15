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
                text: "起始坐标X: "
            }

            SpinBox {
                id: spinbox_startX
                minimumValue: 0
                maximumValue: sourceImage.width
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
                text: "起始坐标Y: "
            }

            SpinBox {
                id: spinbox_startY
                minimumValue: 0
                maximumValue: sourceImage.height
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
                text: "结束坐标X: "
            }

            SpinBox {
                id: spinbox_endX
                minimumValue: 0
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 200
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "结束坐标Y: "
            }

            SpinBox {
                id: spinbox_endY
                minimumValue: 0
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 200
            }
        }
    }

    LinearGradient {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        start: Qt.point(spinbox_startX.value, spinbox_startY.value)
        end: Qt.point(spinbox_endX.value, spinbox_endY.value)

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

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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/108.jpg"
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
                text: "R: "
            }

            SpinBox {
                id: spinbox_r
                minimumValue: 0
                maximumValue: 255
                decimals: 0
                stepSize: 1
                value: 255
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "G: "
            }

            SpinBox {
                id: spinbox_g
                minimumValue: 0
                maximumValue: 255
                decimals: 0
                stepSize: 1
                value: 255
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "B: "
            }

            SpinBox {
                id: spinbox_b
                minimumValue: 0
                maximumValue: 255
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
                text: "A: "
            }

            SpinBox {
                id: spinbox_a
                minimumValue: 0
                maximumValue: 1
                decimals: 1
                stepSize: 0.1
                value: 0.3
            }
        }
    }

    ColorOverlay {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        color: Qt.rgba(spinbox_r.value/255, spinbox_g.value/255, spinbox_b.value/255, spinbox_a.value)
    }
}

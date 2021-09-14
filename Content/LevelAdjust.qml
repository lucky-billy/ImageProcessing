import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 10
        sourceSize: Qt.size(512, 763)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/34.jpg"
        smooth: true
    }

    Row {
        id: row
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        spacing: 40

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
    }

    LevelAdjust {
        width: sourceImage.width; height: sourceImage.height
        anchors.top: sourceImage.top
        anchors.left: sourceImage.right
        anchors.leftMargin: 20
        source: sourceImage

        minimumInput: "#000000"
        maximumInput: "#ffffff"
        minimumOutput: "#000000"
        maximumOutput: "#ffffff"
        gamma: Qt.vector3d(spinbox_r.value/255, spinbox_g.value/255, spinbox_b.value/255)
    }
}

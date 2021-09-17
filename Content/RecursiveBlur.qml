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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/82.jpg"
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
                text: "半径: "
            }

            SpinBox {
                id: spinbox_radius
                minimumValue: 0
                maximumValue: 16
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
                text: "迭代次数: "
            }

            SpinBox {
                id: spinbox_loops
                minimumValue: 0
                maximumValue: 9999
                decimals: 0
                stepSize: 1
                value: 1
            }
        }

    }

    RecursiveBlur {
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        radius: spinbox_radius.value
        loops: spinbox_loops.value
    }
}

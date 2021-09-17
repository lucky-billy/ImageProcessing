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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/70.jpg"
        smooth: true
    }

    Image {
        anchors.verticalCenter: sourceImage.verticalCenter
        anchors.left: sourceImage.right
        anchors.leftMargin: 10
        source: "qrc:/Image/material/add.png"
    }

    // 发光源
    Image {
        anchors.left: sourceImage.right
        anchors.leftMargin: 150
        anchors.verticalCenter: sourceImage.verticalCenter
        sourceSize: Qt.size(203, 128)
        source: "qrc:/Image/material/22.png"
        smooth: true
    }

    Column {
        id: column
        anchors.left: glow.right
        anchors.leftMargin: 20
        anchors.verticalCenter: glow.verticalCenter
        spacing: 10

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "光晕半径: "
            }

            SpinBox {
                id: spinbox_glowRadius
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.1
                value: 20
            }
        }

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "强度: "
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
                text: "角半径: "
            }

            SpinBox {
                id: spinbox_cornerRadius
                minimumValue: 0
                maximumValue: 9999
                decimals: 2
                stepSize: 0.05
                value: 25
            }
        }
    }

    Image {
        id: glow
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        sourceSize: Qt.size(430, 300)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/70.jpg"
        smooth: true

        Image {
            id: rect
            x: 100;
            sourceSize: Qt.size(101, 64)
            source: "qrc:/Image/material/22.png"
            smooth: true
        }

        RectangularGlow {
            anchors.fill: rect
            color: "#55ff55"
            glowRadius: spinbox_glowRadius.value
            spread: spinbox_spread.value
            cornerRadius: spinbox_cornerRadius.value
        }
    }
}

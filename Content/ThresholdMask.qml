import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 10
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/87.jpg"
        smooth: true
    }

    Image {
        anchors.verticalCenter: sourceImage.verticalCenter
        anchors.left: sourceImage.right
        anchors.leftMargin: 10
        source: "qrc:/Image/material/add.png"
    }

    // 遮罩
    Image {
        id: mask
        anchors.left: sourceImage.right
        anchors.leftMargin: 150
        anchors.verticalCenter: sourceImage.verticalCenter
        source: "qrc:/Image/material/7.png"
        smooth: true
    }

    Column {
        id: column
        anchors.left: mask.left
        anchors.verticalCenter: thresholdMask.verticalCenter
        spacing: 10

        Row {
            spacing: 10

            Text {
                font.pixelSize: 24
                font.bold: true
                color: "#FFFFFF"
                text: "平滑度: "
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
                text: "阈值: "
            }

            SpinBox {
                id: spinbox_threshold
                minimumValue: 0
                maximumValue: 1
                decimals: 2
                stepSize: 0.05
                value: 0.2
            }
        }

    }

    ThresholdMask {
        id: thresholdMask
        width: 480; height: 270
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 20
        source: sourceImage
        maskSource: mask
        spread: spinbox_spread.value
        threshold: spinbox_threshold.value
    }
}

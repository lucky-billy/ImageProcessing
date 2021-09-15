import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

Rectangle {
    color: "#858585"

    // 源
    Image {
        id: sourceImage
        x: 10; y: 30
        sourceSize: Qt.size(480, 270)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/56.jpg"
        smooth: true
    }

    LinearGradient {
        id: mask
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.right
        anchors.leftMargin: 20
        anchors.verticalCenter: sourceImage.verticalCenter
        start: Qt.point(0, 0)
        end: Qt.point(300, 300)

//        gradient: Gradient {
//            GradientStop { position: 0.2; color: "#ffffffff" }
//            GradientStop { position: 0.5; color: "#00ffffff" }
//        }

        gradient: Gradient {
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

    Column {
        id: column
        anchors.left: blur.right
        anchors.leftMargin: 20
        anchors.verticalCenter: blur.verticalCenter
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
    }

    MaskedBlur {
        id: blur
        width: sourceImage.width; height: sourceImage.height
        anchors.left: sourceImage.left
        anchors.top: sourceImage.bottom
        anchors.topMargin: 40
        source: sourceImage
        maskSource: mask
        radius: spinbox_radius.value
        samples: spinbox_samples.value
    }
}

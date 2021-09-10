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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/15.jpg"
        smooth: true
    }

    Image {
        anchors.verticalCenter: sourceImage.verticalCenter
        anchors.left: sourceImage.right
        anchors.leftMargin: 10
        source: "qrc:/Image/material/add.png"
    }

    // 置换源
    Image {
        id: foregroundImage
        anchors.left: sourceImage.right
        anchors.leftMargin: 150
        anchors.verticalCenter: sourceImage.verticalCenter
        sourceSize: Qt.size(430, 300)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/22.jpg"
        smooth: true
    }

    // 置换
    Displace {
        id: blend
        width: sourceImage.width; height: sourceImage.height
        anchors.top: sourceImage.bottom
        anchors.left: foregroundImage.left
        anchors.topMargin: 20
        source: sourceImage
        displacementSource: foregroundImage
        displacement: spinbox_displacement.value
    }

    Text {
        x: 10
        anchors.top: blend.top
        font.pixelSize: 24
        font.bold: true
        color: "#FFFFFF"
        text: "置换的比例: "
    }

    SpinBox {
        id: spinbox_displacement
        x: 150
        anchors.top: blend.top
        minimumValue: -1
        maximumValue: 1
        decimals: 2
        stepSize: 0.05
        value: 0
    }
}

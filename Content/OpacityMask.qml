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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/1.jpg"
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
        sourceSize: Qt.size(480, 270)
        source: "qrc:/Image/material/31.png"
        smooth: true
    }

    // 透明遮罩
    OpacityMask {
        id: blend
        width: sourceImage.width; height: sourceImage.height
        anchors.top: sourceImage.bottom
        anchors.left: sourceImage.left
        anchors.topMargin: 20
        source: sourceImage
        maskSource: mask
    }
}

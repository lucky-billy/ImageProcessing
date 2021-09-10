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
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/100.jpg"
        smooth: true
    }

    Image {
        anchors.verticalCenter: sourceImage.verticalCenter
        anchors.left: sourceImage.right
        anchors.leftMargin: 10
        source: "qrc:/Image/material/add.png"
    }

    // 前置源
    Image {
        id: foregroundImage
        anchors.left: sourceImage.right
        anchors.leftMargin: 150
        anchors.verticalCenter: sourceImage.verticalCenter
        sourceSize: Qt.size(430, 300)
        source: "file:///D:/Qt/ImageProcessing/Image/wallpaper/105.jpg"
        smooth: true
    }

    // 混合
    Blend {
        id: blend
        width: sourceImage.width; height: sourceImage.height
        anchors.top: sourceImage.bottom
        anchors.left: foregroundImage.left
        anchors.topMargin: 20
        source: sourceImage
        foregroundSource: foregroundImage
        mode: "normal"
    }

    Text {
        x: 10
        anchors.top: blend.top
        font.pixelSize: 24
        font.bold: true
        color: "#FFFFFF"
        text: "混合模式: "
    }

    ComboBox {
        id: combobox
        x: 150
        width: 100
        anchors.top: blend.top
        editable: false

        model: ListModel {
            id: model
            ListElement { type: "normal" }          // 把前置源的像素分量值通过使用 alpha 混合写入源
            ListElement { type: "addition" }        // 把源和前置源中的像素分量值相加
            ListElement { type: "average" }         // 对源和前置源中的像素分量值进行平均
            ListElement { type: "color" }           // 把源的明度值与前置源的色调和饱和度相结合
            ListElement { type: "colorBurn" }       // 源中较暗的像素越暗，如果源和前置源像素都是亮的，则结果是亮的
            ListElement { type: "colorDodge" }      // 源像素越亮，亮度越高，如果源像素和前置源像素都暗，则结果为暗
            ListElement { type: "darken" }          // 源和前置源中较暗的像素分量值
            ListElement { type: "darkerColor" }     // 源和前置源中较低亮度像素rgb值
            ListElement { type: "difference" }      // 源和前置源之间的绝对像素分量值差
            ListElement { type: "divide" }          // 源的像素分量值除以前置源的值
            ListElement { type: "exclusion" }       // 源和前置源之间对比度降低的像素分量值差
            ListElement { type: "hardLight" }       // 源中的像素分量值根据前置源值变亮或变暗
            ListElement { type: "hue" }             // 源的饱和度和亮度与前置源的色调值相结合
            ListElement { type: "lighten" }         // 源和前置源中最轻的像素分量值
            ListElement { type: "lighterColor" }    // 源和前置源的较高亮度像素rgb值
            ListElement { type: "lightness" }       // 源的色调和饱和度与前置源的亮度值相结合
            ListElement { type: "multiply" }        // 源和前置源的像素分量值相乘
            ListElement { type: "negation" }        // 源和前置源之间的反转绝对像素分量值差
            ListElement { type: "saturation" }      // 源的色调和亮度与前置源的饱和度值相结合
            ListElement { type: "screen" }          // 源和前置源的像素值被求反，然后相乘，再次求反
            ListElement { type: "subtract" }        // 前置源的像素值从源中分块
            ListElement { type: "softLight" }       // 源中的像素分量值根据前置源值稍微变亮或变暗
        }

        onCurrentIndexChanged: blend.mode = model.get(currentIndex).type
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    width: 1200; height: 900
    title: qsTr("Image processing demo")
    visible: true

    // Module Bar
    ListView {
        x: 5
        width: 100; height: parent.height - 10
        anchors.verticalCenter: parent.verticalCenter
        boundsBehavior: Flickable.StopAtBounds
        spacing: 10
        clip: true

        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

        model: ListModel {
            ListElement { effectName: "混合" }
            ListElement { effectName: "亮度对比度" }
            ListElement { effectName: "颜色覆盖" }
            ListElement { effectName: "着色" }
            ListElement { effectName: "圆锥渐变" }
            ListElement { effectName: "去饱和" }
            ListElement { effectName: "方向模糊" }
            ListElement { effectName: "置换" }
            ListElement { effectName: "滤镜" }
            ListElement { effectName: "快速模糊" }
            ListElement { effectName: "伽马射线" }
            ListElement { effectName: "高斯模糊" }
            ListElement { effectName: "发光" }
            ListElement { effectName: "色调" }
            ListElement { effectName: "内阴影" }
            ListElement { effectName: "水平调整" }
            ListElement { effectName: "线性渐变" }
            ListElement { effectName: "遮罩模糊" }
            ListElement { effectName: "透明遮罩" }
            ListElement { effectName: "径向模糊" }
            ListElement { effectName: "径向渐变" }
            ListElement { effectName: "矩形发光" }
            ListElement { effectName: "递归模糊" }
            ListElement { effectName: "阈值遮罩" }
            ListElement { effectName: "变焦模糊" }
        }

        delegate: Component {
            Button {
                text: effectName
                onClicked: changeIndex(model.index + 1)
            }
        }
    }

    // Separator line - portrait
    Rectangle {
        x: 110
        width: 4; height: parent.height - 10
        radius: 4
        anchors.verticalCenter: parent.verticalCenter
        color: "#707070"
    }

    // StackView
    StackView {
        id: stack
        x: 119
        width: 1200 - 119 - 5; height: parent.height - 10
        anchors.verticalCenter: parent.verticalCenter

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 10
            }
        }

        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 10
            }
        }

        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 10
            }
        }

        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 10
            }
        }
    }

    function changeIndex(pageID) {
        stack.clear()

        switch ( pageID )
        {
        case 1: stack.push("./Content/Blend.qml"); break;
        case 2: stack.push("./Content/BrightnessContrast.qml"); break;
        case 3: stack.push("./Content/ColorOverlay.qml"); break;
        case 4: stack.push("./Content/Colorize.qml"); break;
        case 5: stack.push("./Content/ConicalGradient.qml"); break;
        case 6: stack.push("./Content/Desaturate.qml"); break;
        case 7: stack.push("./Content/DirectionalBlur.qml"); break;
        case 8: stack.push("./Content/Displace.qml"); break;
        case 9: stack.push("./Content/DropShadow.qml"); break;
        case 10: stack.push("./Content/FastBlur.qml"); break;
        case 11: stack.push("./Content/GammaAdjust.qml"); break;
        case 12: stack.push("./Content/GaussianBlur.qml"); break;
        case 13: stack.push("./Content/Glow.qml"); break;
        case 14: stack.push("./Content/HueSaturation.qml"); break;
        case 15: stack.push("./Content/InnerShadow.qml"); break;
        case 16: stack.push("./Content/LevelAdjust.qml"); break;
        case 17: stack.push("./Content/LinearGradient.qml"); break;
        case 18: stack.push("./Content/MaskedBlur.qml"); break;
        case 19: stack.push("./Content/OpacityMask.qml"); break;
        case 20: stack.push("./Content/RadialBlur.qml"); break;
        case 21: stack.push("./Content/RadialGradient.qml"); break;
        case 22: stack.push("./Content/RectangularGlow.qml"); break;
        case 23: stack.push("./Content/RecursiveBlur.qml"); break;
        case 24: stack.push("./Content/ThresholdMask.qml"); break;
        case 25: stack.push("./Content/ZoomBlur.qml"); break;
        }

        // Keep the sub interface the same width and height as stackview
        stack.currentItem.width = stack.width
        stack.currentItem.height = stack.height
    }
}

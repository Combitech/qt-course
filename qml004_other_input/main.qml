import QtQuick 2.6

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    Rectangle{
        x: flick.x
        y: flick.y-height+2
        height: 30
        width: text1.width + 10
        anchors.left: flick.left
        border.width: 2
        color: "white"
        border.color: "black"
        Text{
            id: text1
            font.pointSize: 15
            anchors.centerIn: parent
            text: "Image 1, Flickable"
        }
    }
    Rectangle {
        id: flick
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.margins: 30
        color: "white"
        border.color: "black"
        border.width: 2
        clip: true

        Flickable {
            anchors.fill: parent
            anchors.margins: 2
            contentHeight: img.height
            contentWidth: img.width
            flickableDirection: Flickable.HorizontalAndVerticalFlick

            Image {
                id: img
                width: flick.width*2
                height: flick.height*2
                source: "san-francisco.jpg"
            }
        }
        Rectangle{
            // make a border over the image
            color: "transparent"
            anchors.fill: flick
            border.color: "black"
            border.width: 2
        }
    }
    Rectangle{
        x: pinchImage.x
        y: pinchImage.y-height+2
        height: 30
        width: text2.width + 10
        anchors.left: pinchImage.left
        border.width: 2
        color: "white"
        border.color: "black"
        Text{
            id: text2
            font.pointSize: 15
            anchors.centerIn:parent
            text: "Image 2, Pinch and Arrow Keys"
        }
    }
    Rectangle {
        id:pinchImage
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.horizontalCenter
        anchors.margins: 30
        color: "white"
        border.color: "black"
        border.width: 2
        clip: true

        Image {
            id: img2
            x:parent.width/2-width/2
            y:parent.height/2-height/2
            source: "zlatan-ibrahimovic.jpg"
            focus: true

            Keys.onPressed: {
                if(event.key === Qt.Key_Left && x > -width/2) {
                    img2.x -=5
                } else if(event.key === Qt.Key_Right && x < parent.width-width/2) {
                    img2.x +=5
                } else if(event.key === Qt.Key_Up && y > -height/2) {
                    img2.y -=5
                } else if(event.key === Qt.Key_Down && y < parent.height-height/2) {
                    img2.y +=5
                }
            }
            // Touch screens (zoom,scale,pan)
            PinchArea {
                anchors.fill: parent
                pinch.target: img2
                pinch.minimumRotation: -360
                pinch.maximumRotation: 360
                pinch.minimumScale: 0.1
                pinch.maximumScale: 10
                pinch.dragAxis: Pinch.XAndYAxis
                onSmartZoom: {
                    console.log("smart zoom")
                }
                onPinchStarted: {
                    console.log("pinch started")
                }
                onPinchUpdated: {
                    console.log("pinch updated")
                }
            }

            MouseArea {
                anchors.fill: parent
                drag.target: img2
                onWheel: {
                    console.log(wheel.angleDelta.x, wheel.angleDelta.y)
                    img2.scale += img2.scale * wheel.angleDelta.y / 120 / 10;
                }
            }
        }
        Rectangle{
            // make a border over the image
            color: "transparent"
            anchors.fill: pinchImage
            border.color: "black"
            border.width: 2
        }
    }

}


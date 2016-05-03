import QtQuick 2.4
import QtQuick.Window 2.2

// Show difference using Image and BorderImage
// and its use case

//BorderImage {
Image {
    id: root

    width: 600
    height: 800
    anchors.fill: parent

    property bool loadScene: false

    /*border {
        top: 120
        bottom: 120
        right: 100
        left: 100
    }*/

    source: "frame.jpg"

    MouseArea {
        id: loadButton
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        height: 50
        onClicked: root.loadScene = !root.loadScene

        Text {
            anchors.centerIn: parent
            font.pointSize: 20
            text: root.loadScene ? "Unload" : "Load"
        }
    }

    ListModel {
        id: imageModel
        ListElement {myImage: "big_pine_landscape.jpg"}
        ListElement {myImage: "homer-simpson.svg"}
        ListElement {myImage: "servers.jpg"}
        ListElement {myImage: "tatto.png"}
        ListElement {myImage: "zebra.png"}
    }

    Component {
        id: imageDelegate
        Rectangle {
            width: ListView.view.width/2
            height: ListView.view.height/3
            color: "gray"
            border.width: 2

            Image {
                anchors.fill: parent
                source: myImage

                // Show the difference when reloading the image
                // by changing its sourceSize. Will force a
                // reload of the images in the new size.
                //sourceSize.width: width
                //sourceSize.height: height


                // Show the big difference when using ansynchronous
                // image loading.
                //asynchronous: true
            }
        }
    }

    Loader {
        anchors.top: loadButton.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 100
        active: root.loadScene
        sourceComponent: ListView {
            id: list
            model: imageModel
            delegate: imageDelegate
        }
    }

    // Spinning circle in-order to see that
    // we have a smooth running UI.
    // This should be running smooth as
    // long as we can deliver 60 fps.

    /*Rectangle {
        id: spinningRect
        width: 200
        height: 200
        radius: 100
        border.color: "lightgreen"
        border.width: 26
        color: "transparent"
        anchors.centerIn: parent


        NumberAnimation {
            target: spinningRect
            property: "rotation"
            duration: 2000
            from: 0
            to: 359
            loops: Animation.Infinite
            running: true
        }

        Rectangle {
            width: 26;
            height: 26
            radius: 13
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }*/
}

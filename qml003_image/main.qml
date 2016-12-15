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
    Rectangle{
        id: loadButton
        width: 220
        height: 75
        z: 10
        border.width: 5
        border.color: "black"
        color: "#DDD"
        radius: 10
        anchors.top: parent.top
        anchors.topMargin: parent.height/2
        anchors.right: parent.right
        anchors.rightMargin: 70

        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.border.width-=2
                loadButton.color = "#DDD"
                root.loadScene = !root.loadScene
            }
            onPressed: {
                loadButton.color = "#EEE"
                parent.border.width+=2
            }
            Text {
                anchors.centerIn: parent
                font.pointSize: 20
                text: root.loadScene ? "Unload Images" : "Load Images"
            }
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
                // by changing spinningRects sourceSize. Will force a
                // reload of the images in the new size.
//                sourceSize.width: width
//                sourceSize.height: height

                // Show the big difference when using ansynchronous
                // image loading.
//                asynchronous: true
            }
        }
    }

    Loader {
        anchors.margins: 100
        anchors.top: root.top
        anchors.topMargin: 160
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 150

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
        z: 5
        width: 200
        height: 200
        radius: 100
        border.color: "lightgreen"
        border.width: 26
        color: "transparent"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.right: parent.right
        anchors.rightMargin: 90


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

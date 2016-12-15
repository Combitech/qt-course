import QtQuick 2.6

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    View {
        id: dynamicView
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 10
        color: "light gray"
    }
    Rectangle{
        anchors.fill: dynamicView
        color: "transparent"
        border.color: "black"
        border.width: 2
    }

    Item {
        anchors.right: parent.right
        anchors.left: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Column {
            anchors.centerIn: parent
            spacing: 10

            Row {
                width: 300; height: 100
                Text {
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    text: "Rectangles: "
                }
                TextEdit {
                    id: inputRects
                    font.pixelSize: 25
                    verticalAlignment: Text.AlignVCenter
                    text: "100"
                }
            }

            Button {
                buttonText: dynamicView.loadedActive ? "Un-Load" : "Load"
                onButtonClicked: {
                    console.time("load")
                    dynamicView.numberOfRects = parseInt(inputRects.text)
                    dynamicView.loadedActive = !dynamicView.loadedActive
                    console.timeEnd("load")
                }
            }

            Button {
                buttonText: "Asynchronous - " + (dynamicView.loadedAsynchronous ? "TRUE" : "FALSE")
                onButtonClicked: dynamicView.loadedAsynchronous = !dynamicView.loadedAsynchronous
            }

            Text {
                width: 300; height: 100
                font.pixelSize: 25
                verticalAlignment: Text.AlignVCenter
                text: "Status: " + loadingStatusToText()

                function loadingStatusToText() {
                    if(dynamicView.loadedStatus === Loader.Null) {
                        return "Null"
                    } else if(dynamicView.loadedStatus === Loader.Loading) {
                        return "Loading"
                    } else if(dynamicView.loadedStatus === Loader.Ready) {
                        return "Ready"
                    } else if(dynamicView.loadedStatus === Loader.Error) {
                        return "Error"
                    } else {
                        return ""
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        width: 100
        height: 100
        color: "orange"
        radius: 50
        SequentialAnimation on x {
            running: true
            loops: Animation.Infinite // The animation is set to loop indefinitely
            NumberAnimation { from: 400; to: 700; duration: 2000; easing.type: Easing.Linear }
            NumberAnimation { from: 700; to: 400; duration: 2000; easing.type: Easing.Linear }
        }
    }
}


import QtQuick 2.4
import "ballCreator.js" as BC

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    Item {
        id: ballContainer
        anchors.fill: parent
    }

    ListView {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 200
        spacing: 10
        model: ballContainer.children.length
        delegate: Rectangle {
            width: 200
            height: 100
            border.color: "black"
            border.width: 2
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: index
            }
            MouseArea {
                anchors.fill: parent
                onClicked: ballContainer.children[index].destroy()
            }
        }
    }

    Timer {
        id: ballCreatorTimer
        interval: 3000
        running: true
        repeat: true
        onTriggered: {
            var xPos = Math.random() * 550
            var yPos = Math.random() * 550
            BC.createBallObject(xPos,yPos)

            //BC.createGreenBall(xPos,yPos)
        }
    }

//    Component {
//        id: green_ball
//        Rectangle {
//            width: 50
//            height: 50
//            radius: 25
//            color: "green"
//            border.color: "black"
//            border.width: 2
//        }
//    }
}



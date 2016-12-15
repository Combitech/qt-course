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
    Rectangle{
        anchors.fill: listView
        color: "gray"
        border.color: "black"
        border.width: 2
    }
    ListView {
        id: listView
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
            radius: 10
            color: "lightblue"
            Text {
                anchors.centerIn: parent
                text: index
            }
            Rectangle{
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                border.color: "black"
                width: text.width + 10
                height: text.height + 15
                radius: 10
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: "Remove"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: ballContainer.children[index].destroy()
                }
            }
        }
    }
    Timer {
        id: ballCreatorTimer
        interval: 1500
        running: true
        repeat: true
        onTriggered: {
            var xPos = Math.random() * 550
            var yPos = Math.random() * 550
            BC.createBallObject(xPos,yPos)
            //BC.createGreenBall(xPos,yPos)
        }
    }

    Component {
        id: green_ball
        Rectangle {
            width: 50
            height: 50
            radius: width/2
            color: "green"
            border.color: "black"
            border.width: 2
        }
    }
}



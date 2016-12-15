import QtQuick 2.0

Rectangle {
    width: 50
    height: 50
    color: "lightsteelblue"
    border.color: "black"
    border.width: 2
    x: parent.width/2 - width/2
    y: parent.height/2 - height/2
    radius: 10
    MouseArea {
        drag.minimumX: 0
        drag.maximumX: parent.parent.width - parent.width
        drag.minimumY: 0
        drag.maximumY: parent.parent.height - parent.height
        anchors.fill: parent
        drag.target: parent
    }
}

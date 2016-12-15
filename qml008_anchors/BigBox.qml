import QtQuick 2.0

Rectangle {
    width: 200
    height: 200
    color: "orange"
    border.color: "black"
    border.width: 2
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

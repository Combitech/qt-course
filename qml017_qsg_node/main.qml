import QtQuick 2.4
import Polygons 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    Triangle {
        id: line
        width: 200
        height: 200
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2

        lineColor: "green"
        p1: Qt.point(0,0)
        p2: Qt.point(200,movingPoint)
        p3: Qt.point(100,200)

        property real movingPoint: 0.0

        SequentialAnimation on movingPoint {
            running: mmaTriangle.pressed
            NumberAnimation { to: 100; duration: 2000; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0; duration: 2000; easing.type: Easing.InOutQuad }
            loops: Animation.Infinite
        }

        MouseArea {
            id: mmaTriangle
            drag.target: parent
            anchors.fill: parent
        }
    }
}



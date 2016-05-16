import QtQuick 2.0

Rectangle {
    width: 200
    height: 200
    color: "orange"
    border.color: "black"
    border.width: 2

    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }
}

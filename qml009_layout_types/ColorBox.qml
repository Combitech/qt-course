import QtQuick 2.0

Rectangle {
    border.color: "black"
    border.width: 2
    radius: 10
    property int myIndex: Positioner.index
    Text {
        anchors.centerIn: parent
        font.pixelSize: 25
        text: myIndex
    }
}

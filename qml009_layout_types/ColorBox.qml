import QtQuick 2.0

Rectangle {
    property int myIndex: Positioner.index
    Text {
        anchors.centerIn: parent
        font.pixelSize: 25
        text: myIndex
    }
}

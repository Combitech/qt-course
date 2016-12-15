import QtQuick 2.0

Rectangle {
    width: 150
    height: 50
    color: "green"
    border.color: "black"
    border.width: 3
    radius: 10

    signal btnClicked()

    Text {
        anchors.centerIn: parent
        font.pixelSize: 25
        text: "MOVE"
    }

    MouseArea {
        anchors.fill: parent
        onPressed: parent.color = "dark green"
        onReleased: parent.color = "green"
        onClicked: btnClicked()
    }
}

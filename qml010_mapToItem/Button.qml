import QtQuick 2.0

Rectangle {
    width: 150
    height: 50
    color: "green"

    signal btnClicked()

    Text {
        anchors.centerIn: parent
        font.pixelSize: 25
        text: "MOVE"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: btnClicked()
    }
}

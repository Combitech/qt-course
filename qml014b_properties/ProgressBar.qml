import QtQuick 2.0

Rectangle {
    border.width: 1
    border.color: "lightgray"
    radius: 10

    property int progress: 0
    property alias barColor: bar.color

    Rectangle {
        id: bar
        radius: parent.radius
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: progress * (parent.width / 100);

        Behavior on width {
            NumberAnimation { duration: 750 }
        }
    }
}

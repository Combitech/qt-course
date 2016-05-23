import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    Row {
        Item {
            height: root.height-effectList.height
            width: root.width/2
            Image {
                id: img
                sourceSize.width: 400
                sourceSize.height: 400
                width: sourceSize.width
                height: sourceSize.height
                anchors.centerIn: parent
                source: "pin.png"
            }
        }

        Item {
            height: root.height-effectList.height
            width: root.width/2

            EffectLoader {
                id: effectLoader
                anchors.centerIn: parent
                effectSource: img
            }
        }
    }

    ListView {
        id: effectList
        height: 200
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        orientation: ListView.Horizontal
        spacing: 5
        model: effectLoader.model
        delegate: Rectangle {
            height: effectList.height
            width: effectList.width/4
            color: "darkgray"
            radius: 20

            Text {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.pixelSize: 30
                color: "white"
                text: effect
            }

            MouseArea {
                anchors.fill: parent
                onClicked: effectLoader.loadEffect(effect)
            }
        }
    }
}



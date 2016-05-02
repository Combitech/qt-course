import QtQuick 2.0

// List providing all loaded fonts in the system
ListView {
    anchors.fill: parent
    model: Qt.fontFamilies()

    property string fontSelected: currentItem.text

    delegate: Text {
        id: textItem
        width: ListView.view.width
        height: 50
        text: modelData
        font.pointSize: height/2
        font.family: modelData
        verticalAlignment: Text.AlignVCenter

        MouseArea {
            anchors.fill: parent
            onClicked: textItem.ListView.view.currentIndex = index
        }
    }
    highlight: Rectangle {
        width: ListView.view.currentItem.width
        height: ListView.view.currentItem.height
    }
}

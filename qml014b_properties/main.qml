import QtQuick 2.5

Rectangle {
    width: 800
    height: 600

    Text {
        id: txtClk
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 30
        text: po.noClicks
    }

    Text {
        anchors.left: txtClk.right
        anchors.leftMargin: 10
        anchors.baseline: txtClk.baseline
        font.pixelSize: 20
        text: "global clicks"
    }

    ProgressBar {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        anchors.margins: 50

        progress: po.progress
        barColor: "#4296ff"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: po.noClicks++
    }
}

import QtQuick 2.4
import QtMultimedia 5.5

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    MediaPlayer {
        id: mediaplayer
        source: "big_buck_bunny.mp4"

        onStatusChanged: console.log(status)
        onPlaybackStateChanged: console.log(playbackState)
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("play")
            mediaplayer.play()
        }
    }
}



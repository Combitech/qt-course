import QtQuick 2.4
import QtMultimedia 5.5

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"


    MediaPlayer {
        id: mediaplayer
        source: "big_buck_bunny.mp4"
        //source: "centaur_1.mpeg"
        onError: console.log("error: ", errorString)

        onDurationChanged: console.log("duration: ", duration)
        onPositionChanged: console.log("position: ", position)

        onStatusChanged: {
            if(status === MediaPlayer.NoMedia) {
                console.log("status: MediaPlayer.NoMedia")
            } else if(status === MediaPlayer.Loading) {
                console.log("status: MediaPlayer.Loading")
            } else if(status === MediaPlayer.Loaded) {
                console.log("status: MediaPlayer.Loaded")
            } else if(status === MediaPlayer.Buffering) {
                console.log("status: MediaPlayer.Buffering")
            } else if(status === MediaPlayer.Stalled) {
                console.log("status: MediaPlayer.Stalled")
            } else if(status === MediaPlayer.Buffered) {
                console.log("status: MediaPlayer.Buffered")
            } else if(status === MediaPlayer.EndOfMedia) {
                console.log("status: MediaPlayer.EndOfMedia")
            } else if(status === MediaPlayer.InvalidMedia) {
                console.log("status: MediaPlayer.InvalidMedia")
            } else if(status === MediaPlayer.UnknownStatus) {
                console.log("status: MediaPlayer.UnknownStatus")
            }
        }

        onPlaybackStateChanged: {
            if(playbackState === MediaPlayer.PlayingState) {
                console.log("playbackState: MediaPlayer.PlayingState")
            } else if(playbackState === MediaPlayer.PausedState) {
                console.log("playbackState: MediaPlayer.PausedState")
            } else if(playbackState === MediaPlayer.StoppedState) {
                console.log("playbackState: MediaPlayer.StoppedState")
            }
        }

        onAvailabilityChanged: {
            if(availability === MediaPlayer.Available) {
                console.log("availability: MediaPlayer.Available")
            } else if(availability === MediaPlayer.Busy) {
                console.log("availability: MediaPlayer.Busy")
            } else if(availability === MediaPlayer.Unavailable) {
                console.log("availability: MediaPlayer.Unavailable")
            } else if(availability === MediaPlayer.ResourceMissing) {
                console.log("availability: MediaPlayer.ResourceMissing")
            }
        }
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer

        onContentRectChanged: console.log("cr: ", contentRect)
        onSourceRectChanged: console.log("sr", sourceRect)
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("play")
            mediaplayer.play()
        }
    }
}





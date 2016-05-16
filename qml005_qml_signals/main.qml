import QtQuick 2.4

// The grass
Rectangle {
    id: grass
    anchors.fill: parent
    color: earthquake ? "red" : "green"

    property bool earthquake: false

    signal landMoved(int posX, int posY)

    function earthQuakeStarted() {
        earthquake = true
        grass.landMoved.connect(snailMother.setSnailPosition)
    }

    function earthQuakeStopped() {
        earthquake = false
        grass.landMoved.disconnect(snailMother.setSnailPosition)
    }

    Timer {
        id: earthquakeTimer
        running: earthquake
        repeat: true
        interval: 500
        onTriggered: {
            var xPos = Math.random() * grass.width
            var yPos = Math.random() * grass.height
            landMoved(xPos, yPos)
        }
    }

    MouseArea {
        id: snailPlacer
        anchors.fill: parent

        // Declare signal
        signal moveSnail(int posX, int posY)

        onClicked: {
            // Emit signal
            moveSnail(mouse.x,mouse.y)
        }
        onPressAndHold: {
            if(earthquake) {
                grass.earthQuakeStopped()
            } else {
                grass.earthQuakeStarted()
            }
        }
    }

    Rectangle {
        id: snailHome
        width: snailMother.width
        height: snailMother.height
        color: "transparent"
        border.color: "black"
        border.width: 2
    }

    Image {
        id: snailMother
        width: 100
        height: 100
        source: "snail2.png"

        signal takeMeHome(int posX, int PosY)
        signal movedToPosition(int posX, int posY)

        function setSnailPosition(snailX,snailY) {
            // Move to position
            snailMother.x = snailX
            snailMother.y = snailY

            // Emit signal telling where you moved
            movedToPosition(snailX, snailY)
        }

        MouseArea {
            anchors.fill: parent
            onPressAndHold: {
                // Emit signal that you want to go home
                snailMother.takeMeHome(0,0)
            }
        }
    }

    // Add a child and see what is happening
    /*Image {
        id: snailChild
        width: 100
        height: 100
        source: "snail2.png"
        scale: 0.5

        function setSnailPosition(snailX,snailY) {
            snailChild.x = snailX - snailMother.width
            snailChild.y = snailY
        }

        Component.onCompleted: {
            // Connect signal to signal
            // The child will follow its mother
            snailMother.movedToPosition.connect(setSnailPosition)
        }
    }*/

    Component.onCompleted: {
        // Connect signal to slot
        snailPlacer.moveSnail.connect(snailMother.setSnailPosition)

        // Connect signal to signal
        snailMother.takeMeHome.connect(snailPlacer.moveSnail)
    }
}

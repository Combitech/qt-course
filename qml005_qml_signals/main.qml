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
            var xPos = Math.random() * grass.width % grass.parent.width
            var yPos = Math.random() * grass.height % grass.parent.height
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
            moveSnail(mouse.x-50,mouse.y-50)
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
        radius: width/2
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
//    Image {
//        id: snailChild
//        width: 100
//        height: 100
//        source: "snail2.png"
//        scale: 0.5

//        function setSnailPosition(snailX,snailY) {
//            snailChild.x = snailX - snailMother.width*0.75
//            snailChild.y = snailY
//        }

//        Component.onCompleted: {
//            // Connect signal to signal
//            // The child will follow its mother
//            snailMother.movedToPosition.connect(setSnailPosition)
//        }
//    }
    Rectangle{
        id: questionMark
        width: 50
        height: width
        x: parent.width-width
        color: "dark grey"
        border.color: "black"
        border.width: 3
        radius: 10
        Text {
            anchors.centerIn: parent
            font.pointSize: 20
            text: "?"
        }
        MouseArea{
            anchors.fill: parent
            onPressed: {
                questionMark.color = "light grey"
                if(helpBox.visible)
                    helpBox.visible = false
                else
                    helpBox.visible = true
            }
            onReleased: questionMark.color = "dark grey"
        }
    }
    Rectangle{
        id: helpBox
        anchors.centerIn: parent
        width: helpText.width + 10
        height: 60
        color:"white"
        border.color: "black"
        border.width: 3
        radius: 10
        visible: false
        Text {
            id: helpText
            anchors.centerIn: parent
            text: {"Click on map to move snail to that position"
                + "\nClick and hold to toggle Earthquake."
                + "\nClick and hold on snail to go home"
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: helpBox.visible = false
        }
    }

    Component.onCompleted: {
        // Connect signal to slot
        snailPlacer.moveSnail.connect(snailMother.setSnailPosition)

        // Connect signal to signal
        snailMother.takeMeHome.connect(snailPlacer.moveSnail)
    }
}

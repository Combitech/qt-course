import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    Rectangle {
        id: animationObject
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        width: 200
        height: 200
        color: "orange"

        scale: rectMa.pressed ? 1.5 : 1
        rotation: rectMa.pressed ? 270 : 0

        Behavior on scale {
            NumberAnimation {
                duration: 1000
                //selects an easing curve to interpolate with
                easing.type: Easing.OutBounce
            }
        }
        Behavior on rotation {
            NumberAnimation {
                duration: 2000
                easing.type: Easing.OutBounce
            }
        }

        /*
        states: [
            State {
                when: rectMa.pressed
                name: "PressedState"
                PropertyChanges {
                    target: animationObject
                    scale: 1.5
                    rotation: 270
                    color: "green"
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "PressedState"
                SequentialAnimation {
                    NumberAnimation {property: "scale"; duration: 250; easing.type: Easing.OutBounce}
                    ColorAnimation {duration: 1000}
                    PauseAnimation {duration: 500}
                    NumberAnimation {property: "rotation"; duration: 2500; easing.type: Easing.OutBounce}
                }
            },
            Transition {
                from: "PressedState"
                to: "*"
                //ParallelAnimation {
                SequentialAnimation {
                    NumberAnimation {property: "rotation"; duration: 2500; easing.type: Easing.OutBounce}
                    ColorAnimation {duration: 1000}
                    //ScriptAction {script: animationObject.dummyCalculations()}
                    NumberAnimation {property: "scale"; duration: 250; easing.type: Easing.OutBounce}

                }
            }
        ]

        function dummyCalculations() {
            var tot = 0;
            for(var i = 0; i < 100000; i++) {
                var j = Math.abs(345.21 + i)
                var k = Math.random() * i
                var l = Math.round(k+j)
            }
            tot = i+j+k
        }
        */

        MouseArea {
            id: rectMa
            anchors.fill: parent
        }
    }


/*
    Rectangle {
        id: movingRect
        anchors.bottom: parent.bottom
        width: 100
        height: 100
        color: "blue"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                animationX.running = !animationX.running
            }
        }

        SequentialAnimation on x {
            id: animationX
            running: false
            loops: Animation.Infinite // The animation is set to loop indefinitely
            NumberAnimation { from: 0; to: 700; duration: 2000; easing.type: Easing.Linear }
            NumberAnimation { from: 700; to: 0; duration: 2000; easing.type: Easing.Linear }
        }
    }
    */
}



import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    //color: "transparent"

    Rectangle {
        id: dropDownMeun
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        width: parent.width - 100
        //radius: 10
        //opacity: 0.9

        border.color: "black"
        border.width: 2
        color: "orange"

        state: "open"

        Behavior on x {
            NumberAnimation {
                duration: 500
            }
        }

        function toggleState() {
            if(state === "open") {
                state = "closed"
            } else {
                state = "open"
            }
        }

        Rectangle {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 10
            width: 80
            border.color: "black"
            border.width: 2
            color: "lightgreen"
            //radius: 40

            MouseArea {
                anchors.fill: parent
                onClicked: dropDownMeun.toggleState()
            }

        }

        states: [
            State {
                name: "open"
                PropertyChanges {
                    target: dropDownMeun
                    x: 50
                }
            },
            State {
                name: "closed"
                PropertyChanges {
                    target: dropDownMeun
                    x: root.width - 100
                }

            }

        ]
    }
}



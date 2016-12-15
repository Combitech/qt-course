import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    Rectangle {
        id: dropDownMenu
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        width: parent.width - 100
        radius: 10
        border.color: "black"
        border.width: 2
        color: "orange"
        state: "open"

        Behavior on x {
            NumberAnimation {
                duration: 750
            }
        }

        function toggleState() {
            if(state === "open") {
                state = "closed"
            } else {
                state = "open"
            }
        }
        Row{
            spacing: 5
            anchors.fill: parent
            anchors.margins: 10

            Rectangle {
                id: clickBox
                height: dropDownMenu.height-2*parent.anchors.margins
                width: 80
                border.color: "black"
                border.width: 2
                color: "lightgreen"
                radius: 20

                MouseArea {
                    anchors.fill: parent
                    onClicked: dropDownMenu.toggleState()
                }
                Text {
                    anchors.centerIn: parent
                    rotation: 90
                    font.pixelSize: 30
                    text: "Click me!"
                }
            }
            Boxes{} // only to fill the empty space
        }
        states: [
            State {
                name: "open"
                PropertyChanges {
                    target: dropDownMenu
                    x: 20
                }
            },
            State {
                name: "closed"
                PropertyChanges {
                    target: dropDownMenu
                    x: root.width - (clickBox.width*1.2)
                }
            }
        ]

    }
}



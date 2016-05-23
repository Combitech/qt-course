import QtQuick 2.0

Rectangle {
    id: movableBox
    width: 200;
    height: 200
    border.color: "black"
    border.width: 5

    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }

    Column {
        spacing: 5
        anchors.fill: parent
        anchors.margins: 10
        Row {
            Text {
                font.pixelSize: 25
                text: "X: "
            }
            TextInput {
                id: inputX
                inputMethodHints: Qt.ImhDigitsOnly
                inputMask: "999"
                font.pixelSize: 25
                width: 100
                text: "100"
            }
        }
        Row {
            Text {
                font.pixelSize: 25
                text: "Y: "
            }
            TextInput {
                id: inputY
                inputMethodHints: Qt.ImhDigitsOnly
                inputMask: "999"
                font.pixelSize: 25
                width: 100
                text: "100"
            }
        }

        Button {
            onBtnClicked: {
                //root.moveBox(movableBox,parseInt(inputX.text),parseInt(inputY.text))
                movableBox.x = parseInt(inputX.text)
                movableBox.y = parseInt(inputY.text)
            }
        }

        Text {
            font.pixelSize: 25
            text: "("+ movableBox.x + " ,"+ movableBox.y + ")"
        }
    }
}

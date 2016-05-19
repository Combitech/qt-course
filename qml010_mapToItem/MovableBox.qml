import QtQuick 2.0

Rectangle {
    id: movableBox
    width: 200;
    height: 200
    border.color: "black"
    border.width: 5

    function moveBox() {
        var myPos = movableBox.mapFromItem(root,parseInt(inputX.text),parseInt(inputY.text))

        //var myPos = movableBox.mapToItem(root,0,0)
        console.log(myPos)
//        var newPos = mapToItem(root,parseInt(inputX.text),parseInt(inputY.text))
//        console.log(newPos)
//        x = newPos.x
//        y = newPos.y
    }

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
                //                movableBox.x = inputX.text
                //                movableBox.y = inputY.text
                moveBox()

            }
        }

        Text {
            font.pixelSize: 25
            text: "("+ movableBox.x + " ,"+ movableBox.y + ")"
        }
    }
}

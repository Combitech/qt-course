import QtQuick 2.5
import QtQuick.Controls 2.0
Rectangle {
    id: movableBox
    width: 220
    height: 230
    border.color: "black"
    border.width: 5
    radius: 30
    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }
    Column {
        anchors.fill: parent
        anchors.topMargin: 15
        anchors.margins: 10
        spacing: 5
        Row {
            Text {
                font.pixelSize: 25
                text: "X: "
            }
            TextField{
                y: -5       // default is a little offset
                id: inputX
                inputMethodHints: Qt.ImhDigitsOnly
                inputMask: "999"
                font.pixelSize: 25
                width: 100
                text: "100"
                selectByMouse: true
                KeyNavigation.tab: inputY   // when tabbing you stay in the box
            }
        }
        Row {
            Text {
                font.pixelSize: 25
                text: "Y: "
            }
            TextField{
                y: -5
                id: inputY
                inputMethodHints: Qt.ImhDigitsOnly
                inputMask: "999"
                font.pixelSize: 25
                width: 100
                text: "100"
                selectByMouse: true
                KeyNavigation.tab: inputX
            }
        }

        MyButton {
            onBtnClicked: {
                movableBox.x = parseInt(inputX.text)
                movableBox.y = parseInt(inputY.text)
            }
        }

        Text {
            font.pixelSize: 25
            text: "CURRENT POS:<br>("+ movableBox.x + " ,"+ movableBox.y + ")"
        }
    }

}

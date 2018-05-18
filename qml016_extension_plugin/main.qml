import QtQuick 2.4
import plugin.combitech.components 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    CarModel {
        id: carModel
    }

    ListView {
        id: carList
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 10
        model: carModel
        spacing: 5


        add: Transition {
            NumberAnimation { properties: "scale"; from: 0; to: 1; duration: 750;}
        }
        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000; easing.type: Easing.OutBounce }
        }
        remove: Transition {
            NumberAnimation { properties: "scale"; from: 1; to: 0; duration: 750;}
        }


        delegate: Rectangle {
            id: carDelegate
            width: carList.width
            height: carList.height/6
            color: "lightsteelblue"
            border.color: "black"
            border.width: 2
            radius: 10

            Column {
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5
                Text {
                    text: name
                    font.pointSize: carDelegate.height/5
                }
                Text {
                    text: year
                    font.pointSize: carDelegate.height/5
                }
            }

            Rectangle {
                width: height
                height: parent.height/2
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "red"
                border.color: "black"
                radius: width/2

                Text {
                    anchors.centerIn: parent
                    font.pointSize: parent.height/2
                    font.bold: true
                    text: "X"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: carModel.removeCar(index)
                }
            }
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.margins: 10
        border.color: "black"
        border.width: 2

        Column {
            anchors.centerIn: parent
            spacing: 10

            Row {
                Text {
                    font.pixelSize: 30
                    text: "Index: "
                }

                TextInput {
                    id: textIndex
                    font.pixelSize: 30
                    text: "0"
                }
            }
            Row {
                Text {
                    font.pixelSize: 30
                    text: "Name: "
                }

                TextInput {
                    id: textName
                    font.pixelSize: 30
                    text: "Trabant"
                }
            }
            Row {
                Text {
                    font.pixelSize: 30
                    text: "Year: "
                }
                TextInput {
                    id: textYear
                    font.pixelSize: 30
                    text: "1941"
                }
            }

            Rectangle {
                width: 200
                height: 100
                color: "lightgreen"
                border.color: "black"
                border.width: 2
                radius: 25

                Text {
                    font.pixelSize: 30
                    anchors.centerIn: parent
                    text: "Insert"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        carModel.insertCar(parseInt(textIndex.text), textName.text, parseInt(textYear.text))
                    }
                }
            }
        }
    }
}



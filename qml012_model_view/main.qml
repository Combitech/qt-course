import QtQuick 2.4
import QtQuick.Controls 2.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"
    property int maxIndex: 3

    function removeCar(idx) {
        if(idx <= maxIndex && idx >= 0){
            carModel.remove(idx,1)
            root.maxIndex--
        }
    }
    function appendCar(name, year) {
        carModel.append({"name": name, "year": year})
        root.maxIndex++
    }
    function insertCar(idx, name, year) {
        if(idx <= maxIndex && idx >= 0){
            carModel.insert(idx, {"name": name, "year": year})
            root.maxIndex++
        }
    }

    ListModel {
        id: carModel
        ListElement {
            name: "Volvo XC60"
            year: 2015
        }
        ListElement {
            name: "Ferrari F50"
            year: 2004
        }
        ListElement {
            name: "Saab 9-3"
            year: 2007
        }
        ListElement {
            name: "Ford Mustang"
            year: 1969
        }
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

        /*
        add: Transition {
            NumberAnimation { properties: "scale"; from: 0; to: 1; duration: 750;}
        }
        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000; easing.type: Easing.OutBounce }
        }
        remove: Transition {
            NumberAnimation { properties: "scale"; from: 1; to: 0; duration: 750;}
        }
        */

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
                    onClicked: root.removeCar(index)
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
                    width: 100
                    font.pixelSize: 30
                    text: "Index: "
                }

                TextField {
                    id: textIndex
                    inputMethodHints: Qt.ImhDigitsOnly
                    y: -5
                    selectByMouse: true
                    font.pixelSize: 30
                    placeholderText: "Max: " + (maxIndex)
                }
            }
            Row {
                Text {
                    width: 100
                    font.pixelSize: 30
                    text: "Name: "
                }

                TextField {
                    id: textName
                    y: -5
                    font.pixelSize: 30
                    selectByMouse: true
                    text: "Trabant"
                }
            }
            Row {
                Text {
                    width: 100
                    font.pixelSize: 30
                    text: "Year: "
                }
                TextField {
                    id: textYear
                    inputMask: "9999"
                    y: -5
                    selectByMouse: true
                    font.pixelSize: 30
                    text: "1941"
                }
            }
            Column{
                spacing: 10
                Row{
                    spacing: 10
                    Rectangle {
                        width: 150
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
                                root.insertCar(parseInt(textIndex.text), textName.text, parseInt(textYear.text))
                            }
                        }
                    }

                    Rectangle {
                        width: 150
                        height: 100
                        color: "lightgreen"
                        border.color: "black"
                        border.width: 2
                        radius: 25
                        Text {
                            font.pixelSize: 30
                            anchors.centerIn: parent
                            text: "Append"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                root.appendCar(textName.text, parseInt(textYear.text))
                            }
                        }
                    }
                }
                Row{
                    spacing: 10
                    Rectangle {
                        width: 150
                        height: 100
                        color: "lightgreen"
                        border.color: "black"
                        border.width: 2
                        radius: 25

                        Text {
                            font.pixelSize: 30
                            anchors.centerIn: parent
                            text: {
                                "Remove"
                                + "\nFirst"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(maxIndex>0)
                                    removeCar(0)
                            }
                        }
                    }
                    Rectangle {
                        width: 150
                        height: 100
                        color: "lightgreen"
                        border.color: "black"
                        border.width: 2
                        radius: 25

                        Text {
                            font.pixelSize: 30
                            anchors.centerIn: parent
                            text: {
                                "Remove"
                                + "\nLast"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(maxIndex>0)
                                    onClicked: removeCar(maxIndex)
                            }
                        }
                    }
                }
                Rectangle {
                    x: width/2
                    width: 150
                    height: 100
                    color: "lightgreen"
                    border.color: "black"
                    border.width: 2
                    radius: 25

                    Text {
                        font.pixelSize: 30
                        anchors.centerIn: parent
                        text: {
                            "Remove"
                            + "\nIndex"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(maxIndex>0)
                                onClicked: removeCar(textIndex.text)
                        }
                    }
                }
            }
        }
    }
}



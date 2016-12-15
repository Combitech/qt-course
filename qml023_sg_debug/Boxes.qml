import QtQuick 2.0

Rectangle{
    color: "light gray"
    border.color: "black"
    border.width: 2
    height: dropDownMenu.height-2*parent.anchors.margins
    width: parent.width - clickBox.width - 5
     Column{
        spacing: 5
        anchors.fill: parent
        anchors.margins: 10
        Row{
            spacing: 5
            Rectangle{
                id:headerBox
                border.color: "black"
                border.width: 2
                radius: 10
                color: "dark gray"
                height: parent.parent.height*0.32
                width: parent.parent.width
                Text{
                    anchors.centerIn: parent
                    text: "Header box"
                    font.pixelSize: 60
                }
            }
        }
        Row{
            spacing: 5
            Rectangle{
                id:smallBox1
                border.color: "black"
                border.width: 2
                radius: 10
                color: "light blue"
                height: parent.parent.height*0.2
                width: (parent.parent.width/2)-5
                Text{
                    anchors.centerIn: parent
                    text: "Small box 1"
                    font.pixelSize: 20
                }
            }
            Rectangle{
                id:smallBox2
                border.color: "black"
                border.width: 2
                radius: 10
                color: "dark gray"
                height: parent.parent.height*0.2
                width: (parent.parent.width/2)
                Text{
                    anchors.centerIn: parent
                    text: "Small box 2"
                    font.pixelSize: 20
                }
            }
        }
        Row{
            spacing: 5
            Rectangle{
                id:bigBox
                border.color: "black"
                border.width: 2
                radius: 10
                color: "light blue"
                height: parent.parent.height*0.26
                width: parent.parent.width
                Text{
                    anchors.centerIn: parent
                    text: "Big box"
                    font.pixelSize: 40
                }
            }
        }
        Row{
            spacing: 5
            Rectangle{
                id:smallBox3
                border.color: "black"
                border.width: 2
                radius: 10
                color: "dark gray"
                height: parent.parent.height*0.2
                width: (parent.parent.width/2)
                Text{
                    anchors.centerIn: parent
                    text: "Small box 3"
                    font.pixelSize: 20
                }
            }
            Rectangle{
                id:smallBox4
                border.color: "black"
                border.width: 2
                radius: 10
                color: "light blue"
                height: parent.parent.height*0.2
                width: (parent.parent.width/2)-5
                Text{
                    anchors.centerIn: parent
                    text: "Small box 4"
                    font.pixelSize: 20
                }
                Rectangle{
                    id: button
                    height: buttonText.height+ 10
                    width: buttonText.width + 10
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 5
                    radius: 5
                    color: "light gray"
                    border.color: "black"
                    border.width: 2
                    Text {
                        anchors.centerIn: parent
                        id: buttonText
                        text: "Button"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            button.color = "white"
                            button.border.width++
                        }
                        onReleased: {
                            button.color = "light gray"
                            button.border.width--
                        }
                    }
                }
            }
        }
    }
}

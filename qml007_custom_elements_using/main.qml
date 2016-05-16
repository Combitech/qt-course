import QtQuick 2.4

Rectangle {
    anchors.fill: parent

    MyButton {
        buttonText: "Button 1"
        x: 0
        y: 0
    }

    MyButton {
        buttonText: "Button 1"
        x: 150
        y: 0
    }

    MyButton {
        buttonText: "Button 1"
        x: 0
        y: 150
    }

    MyButton {
        buttonText: "Button 1"
        x: 150
        y: 150
    }
}

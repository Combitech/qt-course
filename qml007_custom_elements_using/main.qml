import QtQuick 2.4

Rectangle {
    anchors.fill: parent

    // How to instantiate
    MyButton {
        buttonText: "Button 1"
        x: 0
        y: 0
    }

    MyButton {
        buttonText: "Button 2"
        x: 150
        y: 0
    }

    MyButton {
        buttonText: "Button 3"
        x: 0
        y: 150
    }

    MyButton {
        buttonText: "Button 4"
        x: 150
        y: 150

        onButtonClicked: console.log(buttonText)

        MyButton {
            buttonText: "Button 4_1"
            x: 150
            y: 150

            onButtonClicked: console.log(buttonText)
        }
    }
}

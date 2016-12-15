import QtQuick 2.5

Rectangle {
    // Public scope
    // Default values
    border.color: "black"
    border.width: 2
    width: 100
    height: 50
    color: "#0D0"
    radius: 10

    property alias buttonText: btnText.text
    signal buttonClicked()

    // Private Scope
    Text {
        id: btnText
        anchors.centerIn: parent
        text: "Button"
    }

    // Private Scope
    MouseArea {
        anchors.fill: parent
        onClicked: parent.buttonClicked()
        onPressed: {
            parent.color = "#0F0"
            parent.border.width++
        }        
        onReleased: {
            parent.border.width--
            parent.color = "#0D0"
        }
    }
}

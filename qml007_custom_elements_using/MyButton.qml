import QtQuick 2.5

Rectangle {
    // Public scope
    // Default values
    width: 100
    height: 50
    color: "blue"

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
    }
}

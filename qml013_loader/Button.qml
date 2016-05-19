import QtQuick 2.5

Rectangle {
    // Public scope
    // Default values
    width: 300
    height: 100
    color: "lightgreen"

    property alias buttonText: btnText.text
    signal buttonClicked()

    // Private Scope
    Text {
        id: btnText
        font.pixelSize: 25
        anchors.centerIn: parent
        text: "Button"
    }

    // Private Scope
    MouseArea {
        anchors.fill: parent
        onClicked: parent.buttonClicked()
    }
}

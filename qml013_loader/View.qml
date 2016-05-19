import QtQuick 2.0

Rectangle {
    id: view
    border.color: "black"
    border.width: 2
    clip: true

    property int numberOfRects: 100

    property alias loadedItem: viewLoader.item
    property alias loadedProgress: viewLoader.progress
    property alias loadedStatus: viewLoader.status
    property alias loadedActive: viewLoader.active
    property alias loadedAsynchronous: viewLoader.asynchronous

    Loader {
        id: viewLoader
        anchors.fill: parent
        active: true

        sourceComponent: Flickable {
            anchors.fill: parent
            contentHeight: rectGrid.height
            contentWidth: rectGrid.width

            Grid {
                id: rectGrid
                width: childrenRect.width
                height: childrenRect.height
                spacing: 5
                columns: 6

                Repeater {
                    width: childrenRect.width
                    height: childrenRect.height
                    model: numberOfRects

                    delegate: Rectangle {
                        width: view.width/6
                        height: width
                        color: Qt.rgba(0.01*index,0.05*index,0.025*index)

//                        Text {
//                            anchors.centerIn: parent
//                            text: index
//                        }
                    }
                }
            }
        }
    }
}

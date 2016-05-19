import QtQuick 2.4

Rectangle {
    id: root
    width: 800
    height: 600
    color: "lightgray"


    MovableBox {
        border.color: "blue"
        x: 100
        y: 100
    }

    MovableBox {
        border.color: "orange"
        x: 300
        y: 0

        MovableBox {
            border.color: "green"
            x: 0
            y: 200
        }
    }
}

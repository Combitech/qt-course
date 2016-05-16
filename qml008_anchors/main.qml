import QtQuick 2.4

Rectangle {
    anchors.fill: parent

    BigBox {
        id: big_box_1

        x: 0
        y: 0

        //x: parent.x
        //y: parent.y

        //anchors.left: parent.left
        //anchors.top: parent.top

        SmallBox {}
    }

    BigBox {
        id: big_box_2

        x: 0
        y: 600

        //x: parent.x
        //y: parent.height-height

        //anchors.left: parent.left
        //anchors.bottom: parent.bottom

        SmallBox {}
    }

    BigBox {
        id: big_box_3

        x: 400
        y: 0

        //x: parent.width-width
        //y: parent.y

        //anchors.right: parent.right
        //anchors.top: parent.top

        SmallBox {}
    }

    BigBox {
        id: big_box_4

        x: 400
        y: 600

        //x: parent.width-width
        //y: parent.height-height

        //anchors.right: parent.right
        //anchors.bottom: parent.bottom

        SmallBox {}
    }
}

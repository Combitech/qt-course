import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"
    // Profiler example
    Row {
        spacing: 10
        Rectangle {
            id: firstRect
            color: "red"
            width: parent.width/2
            height: parent.height/4
        }
        Rectangle {
            id: centerRect
            color: "green"
            width: 100
            height: 200
        }
        Rectangle {
            id: lastRect
            color: "blue"
            width: 100
            height: firstRect.height
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    centerRect.width += 10
                }
            }
        }
    }

    // Performance (Console.time example)
//    Rectangle {
//        id: rect
//        color: "red"
//        function printValue(which, value) {
//            //console.log(which + " = " + value);
//        }
//        Component.onCompleted: {
//            console.time("rect")
//            for (var i = 0; i < 100000; ++i) {
//                printValue("red", rect.color.r);
//                printValue("green", rect.color.g);
//                printValue("blue", rect.color.b);
//                printValue("alpha", rect.color.a);
//            }
//            console.timeEnd("rect")
//        }
//    }

//    Rectangle {
//        id: rect2
//        color: "blue"
//        function printValue(which, value) {
//            //console.log(which + " = " + value);
//        }
//        Component.onCompleted: {
//            console.time("rect2")
//            var rectColor = rect2.color
//            for (var i = 0; i < 100000; ++i) {
//                printValue("red", rectColor.r);
//                printValue("green", rectColor.g);
//                printValue("blue", rectColor.b);
//                printValue("alpha", rectColor.a);
//            }
//            console.timeEnd("rect2")
//        }
//    }
}



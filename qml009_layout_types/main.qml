import QtQuick 2.4

Rectangle {
    anchors.fill: parent

    Row {
        spacing: 5
        ColorBox {
            width: 100; height: 100
            color: "red"
        }

        ColorBox {
            width: 100; height: 100
            color: "red"
        }
        Column {
            spacing: 5
            ColorBox {
                width: 100; height: 100
                color: "green"
            }

            ColorBox {
                width: 100; height: 100
                color: "green"
            }

            Row {
                spacing: 5
                ColorBox {
                    width: 100; height: 100
                    color: "orange"
                }
                ColorBox {
                    width: 100; height: 100
                    color: "orange"
                }
                ColorBox {
                    width: 100; height: 100
                    color: "orange"
                }
            }
        }

        Flow {
            spacing: 5
            width: 170
            ColorBox {
                width: 100; height: 100
                color: "pink"
            }
            ColorBox {
                width: 100; height: 100
                color: "pink"
            }
            ColorBox {
                width: 50; height: 50
                color: "pink"
            }
            ColorBox {
                width: 50; height: 50
                color: "pink"
            }
        }
        ColorBox {
            width: 50; height: 50
            color: "lightblue"
        }
    }
}

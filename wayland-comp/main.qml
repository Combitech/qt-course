import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWayland.Compositor 1.1
import QtQuick.Window 2.0

WaylandCompositor {

    ListModel { id: shellSurfaces }

    WlShell {
        onWlShellSurfaceCreated: {
            shellSurfaces.append({shellSurface: shellSurface});
            shellSurface.sendConfigure(Qt.size(swipeView.width, swipeView.height), WlShellSurface.NoneEdge);
        }
    }

    WaylandOutput {
        sizeFollowsWindow: true
        window: ApplicationWindow {
            id: win
            visible: true
            width: 1280
            height: 720
            SwipeView {
                id: swipeView
                anchors.fill: parent
                currentIndex: tabBar.currentIndex

                Repeater {
                    model: shellSurfaces
                    Item {
                        width: swipeView.width
                        height: swipeView.height
                        WaylandQuickItem {
                            anchors.fill: parent
                            sizeFollowsSurface: false
                            surface: modelData.surface
                            onSurfaceDestroyed: shellSurfaces.remove(index)

                        }
                    }
                }
            }

            Drawer {
                height: win.height
                width: 200
                dragMargin: 10

                ListView {
                    anchors.fill: parent
                    model: shellSurfaces
                    delegate: Item {
                        width: swipeView.width
                        height: swipeView.height
                        WaylandQuickItem {
                            anchors.fill: parent
                            sizeFollowsSurface: false
                            surface: modelData.surface
                            onSurfaceDestroyed: shellSurfaces.remove(index)

                        }

                        transform: Scale {
                            origin.x: 0
                            origin.y: 0
                            xScale: 200/1280
                            yScale: xScale
                        }
                    }
                }
            }

            footer: TabBar {
                id: tabBar
                Repeater {
                    model: shellSurfaces
                    delegate: TabButton {
                        text: "Page " + index
                    }
                }
            }
        }
    }
}

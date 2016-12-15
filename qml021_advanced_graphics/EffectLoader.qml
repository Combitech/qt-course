import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: effectLoader
    width: effectLoader.effectSource.width
    height: effectLoader.effectSource.height

    property var effectSource: undefined

    property alias model: effectModel

    function loadEffect(effect) {
        switch(effect){
            case "Blur":
                loader.sourceComponent = effect_blur
                break;
            case "DropShadow":
                loader.sourceComponent = effect_drop_shadow
                break;
            case "Colorize":
                loader.sourceComponent = effect_colorize
                break;
            case "GammaAdjust":
                loader.sourceComponent = effect_gamma_adjust
                break;
            case "Glow":
                loader.sourceComponent = effect_glow
                break;
            case "OpacityMask":
                loader.sourceComponent = effect_opacity_mask
                break;
            default:
                break;
        }
    }

    ListModel {
        id: effectModel

        ListElement { effect: "Blur" }
        ListElement { effect: "DropShadow" }
        ListElement { effect: "Colorize" }
        ListElement { effect: "GammaAdjust" }
        ListElement { effect: "Glow" }
        ListElement { effect: "OpacityMask" }
    }

    Loader {
        id: loader
        width: effectLoader.effectSource.width
        height: effectLoader.effectSource.height
    }

    Component {
        id: effect_blur
        FastBlur {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height
            source: effectLoader.effectSource
            radius: 32
        }
    }

    Component {
        id: effect_drop_shadow
        DropShadow {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height
            horizontalOffset: 10
            verticalOffset: 10
            radius: 12.0
            samples: 17
            color: "#80000000"
            source: effectLoader.effectSource
        }
    }

    Component {
        id: effect_colorize
        Colorize {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height
            source: effectLoader.effectSource
            hue: 0.5
            saturation: 0.7
            lightness: -0.6
        }
    }

    Component {
        id: effect_gamma_adjust
        GammaAdjust {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height
            source: effectLoader.effectSource
            gamma: 0.45
        }
    }

    Component {
        id: effect_glow
        Glow {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height
            source: effectLoader.effectSource
            radius: 18
            samples: 17
            color: "white"
        }
    }

    Component {
        id: effect_opacity_mask
        Item {
            width: effectLoader.effectSource.width
            height: effectLoader.effectSource.height

            Rectangle {
                id: mask
                width: 100
                height: 100
                visible: false
            }

            OpacityMask {
                width: effectLoader.effectSource.width
                height: effectLoader.effectSource.height
                source: effectLoader.effectSource

            }
        }
    }
}

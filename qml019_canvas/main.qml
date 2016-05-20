import QtQuick 2.4

Rectangle {
    id: root
    anchors.fill: parent
    color: "lightgray"

    // Two-dimensional rendering context
    // Context2D QML Type

    Canvas {
        id: mycanvas
        x: 50; y: 50
        width: 300
        height: 300
        onPaint: {
            var ctx = getContext("2d");

            // Fill background
            ctx.fillStyle = "red"
            ctx.fillRect(0, 0, width, height);

            ctx.lineWidth = 5
            ctx.strokeStyle = "white"

            // Draw line
            ctx.beginPath()
            ctx.moveTo(150,50)
            ctx.lineTo(100,100)
            ctx.stroke()
            ctx.lineTo(100,250)
            ctx.stroke()
            ctx.closePath()

            ctx.lineWidth = 10
            ctx.strokeStyle = "blue"

            // Draw lines
            ctx.beginPath()
            ctx.moveTo(250,50)
            ctx.lineTo(200,100)
            ctx.stroke()
            ctx.lineTo(200,250)
            ctx.stroke()
            ctx.closePath()
        }
    }

    Canvas {
        id: mycanvas2
        x: 50; y: 450
        width: 300
        height: 300
        onPaint: {
            var ctx = getContext("2d");

            ctx.fillStyle = "darkgray"
            ctx.fillRect(0, 0, width, height);

            // circle
            context.beginPath();
            context.fillStyle = "orange"
            context.strokeStyle = "white"
            context.lineWidth = 4
            // radius is 60
            context.moveTo(width/2+60, height/2);
            context.arc(width/2, height/2, 60, 0, 2*Math.PI, true)
            context.fill();
            context.stroke();

            // Draw some text
            context.lineWidth = 1
            context.beginPath();
            context.strokeStyle = "lightgreen"
            context.font = "40px sans-serif";
            context.text("Circle", 25, 50);
            context.stroke();
        }
    }

    Canvas {
        id: mycanvas3
        x: 450; y: 50
        width: 300
        height: 300

        property bool start: false

        onPaint: {
            var ctx = getContext("2d");

            if(start) {
                ctx.moveTo(mouseCanvas.mouseX, mouseCanvas.mouseY);
                start = false
            } else {
                ctx.lineWidth = 4
                ctx.strokeStyle = "black"
                ctx.lineTo(mouseCanvas.mouseX, mouseCanvas.mouseY);
                ctx.stroke()
            }
        }

        MouseArea {
            id: mouseCanvas
            anchors.fill: parent
            onPressed: {
                   mycanvas3.start = true
            }
            onPositionChanged: {
                if(pressed) {
                    mycanvas3.requestPaint()
                }
            }
        }
    }

    Canvas {
        id: mycanvas4
        x: 450; y: 450
        width: 300
        height: 300

        property bool arrowFormState: false
        function toggle() {
            console.log("TOGGLE: ", arrowFormState)
            arrowFormState = !arrowFormState
            if(arrowFormState)
                state = "on"
            else
                state = ""
        }

        property color backgroundColor: 'white'
        property color color: 'black'
        property real angle: 0
        property real morphProgress: 0

        onStateChanged: console.log(state)

        states: State {
//            when: arrowFormState
            name: "on"
            PropertyChanges { angle: 180; target: mycanvas4 }
            PropertyChanges { morphProgress: 1; target: mycanvas4 }
        }
        transitions: Transition {
            RotationAnimation {
                property: "angle"
                direction: RotationAnimation.Clockwise
                easing.type: Easing.InOutCubic
                duration: 500
            }
            NumberAnimation {
                property: "morphProgress"
                easing.type: Easing.InOutCubic
                duration: 500
            }
        }

        onAngleChanged: requestPaint()
        onMorphProgressChanged: requestPaint()

        //renderTarget: Canvas.FramebufferObject
        //renderStrategy: Canvas.Cooperative

        onPaint: {
            var ctx = getContext('2d')
            // The context keeps its state between paint calls, reset the transform
            ctx.resetTransform()

            ctx.fillStyle = backgroundColor
            ctx.fillRect(0, 0, width, height)

            // Rotate from the center
            ctx.translate(width / 2, height / 2)
            ctx.rotate(angle * Math.PI / 180)
            ctx.translate(-width / 2, -height / 2)

            var left = width * 0.25
            var right = width * 0.75
            var vCenter = height * 0.5
            var vDelta = height / 6

            // Use our cubic-interpolated morphProgress to extract
            // other animation parameter values
            function interpolate(first, second, ratio) {
                return first + (second - first) * ratio;
            };
            var vArrowEndDelta = interpolate(vDelta, vDelta * 1.25, morphProgress)
            var vArrowTipDelta = interpolate(vDelta, 0, morphProgress)
            var arrowEndX = interpolate(left, right - vArrowEndDelta, morphProgress)

            ctx.lineCap = "square"
            ctx.lineWidth = vDelta * 0.4
            ctx.strokeStyle = color
            var lineCapAdjustment = interpolate(0, ctx.lineWidth / 2, morphProgress)

            ctx.beginPath()
            ctx.moveTo(arrowEndX, vCenter - vArrowEndDelta)
            ctx.lineTo(right, vCenter - vArrowTipDelta)
            ctx.moveTo(left + lineCapAdjustment, vCenter)
            ctx.lineTo(right - lineCapAdjustment, vCenter)
            ctx.moveTo(arrowEndX, vCenter + vArrowEndDelta)
            ctx.lineTo(right, vCenter + vArrowTipDelta)
            ctx.stroke()
        }
        MouseArea {
            anchors.fill: parent;
            onClicked: mycanvas4.toggle()
        }
    }
}



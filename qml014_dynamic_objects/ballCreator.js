
var component;
var ball;
var balls = new Array() // Array holding all my balls

function createBallObject(xPos,yPos) {
    //component = Qt.createComponent("Ball.qml");
    component = Qt.createComponent(green_ball);
    if (component.status == Component.Ready)
        finishCreation(xPos,yPos);
    else
        component.statusChanged.connect(finishCreation);
}
function finishCreation(xPos,yPos) {
    if (component.status == Component.Ready) {
        ball = component.createObject(ballContainer,{"x": xPos, "y": yPos});

        if (ball == null) {
            console.log("Error");
        } else {
            balls.push(ball)
        }

        console.log(balls.length)

    } else if (component.status == Component.Error) {
        console.log("Error:", component.errorString());
    }
}

//function createGreenBall(xPos,yPos) {
//    ball = green_ball.createObject(ballContainer,{"x": xPos, "y": yPos});

//    if (ball == null) {
//        console.log("Error");
//    } else {
//        balls.push(ball)
//    }
//    console.log(balls.length)
//}


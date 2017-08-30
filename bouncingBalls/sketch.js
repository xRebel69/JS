var balls = [];

function setup() {
  createCanvas(600,400);
}

function draw() {
  background(0)
  for (var i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].update();
    //print(balls[0].y);
  }
}

function mousePressed () {
  balls.push(new Ball(mouseX, mouseY));
}

function mouseDragged () {
  balls.push(new Ball(mouseX, mouseY));
}

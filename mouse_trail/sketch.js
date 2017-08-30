function setup() {
  createCanvas(windowWidth, windowHeight);

}

var a = [];

function draw() {
  background(150);

  fill(150,150);
  ellipse(mouseX, mouseY, 20, 20);
  var vec = createVector(mouseX,mouseY);
  a.push(vec);

  if (a.length > 20) {
    a.splice(0,1 );
  }
  for (var i = 0; i < a.length; i++) {
    fill(0, 150);
    ellipse(a[i].x, a[i].y, 10, 10);
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

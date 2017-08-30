var btn;
var btn2;
var slider;
var ballsNo;
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
function setup () {
  createCanvas(windowWidth, windowHeight);

  btn = createButton("Add Ball");
  btn2 = createButton("Clear Balls");
  slider = createSlider(0, 20, 5);
  ballsNo = createP(blls.length);

  btn2.mousePressed(cleaBalls);
  btn.mousePressed(summonBalls);
}

var blls = []
function draw () {
  background(0);

  for (var i = 0; i < blls.length; i++) {
    if (blls[i].outside())  {
      blls.splice(i, 1);
    }
  }
  for (var i = 0; i < blls.length; i++) {
    blls[i].display();
    blls[i].update();

    for (var j = 0; j < blls.length; j++) {
      if(i!=j) {
        blls[i].intersect(blls[j]);
      }

    }
  }

  ballsNo.html(blls.length);
}

function summonBalls() {
  blls.push(new Ball(random(0, width), random(0, height)));
}
function cleaBalls() {
  blls.splice(0, blls.length);
}

function mousePressed() {
  btn.html("kumbaya"+random(5));
}
function mouseDragged () {
  blls.push(new Ball(mouseX, mouseY));
}

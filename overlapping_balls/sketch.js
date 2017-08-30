var circles = [];
function setup() {
  createCanvas(600, 400);
  var protection = 0;
  while(circles.length < 300) {
    var contin = true;

    var x = random(width);
    var y = random(height);
    var r = random(5,20);

    var pos = createVector(x,y,r);

    for (var j = 0; j < circles.length; j++) {
      if (dist(circles[j].x,circles[j].y,x,y) < r+circles[j].z) {
        contin = false;
        print("Asa");
      }

    }

    noStroke();
    fill(255,0,0,150);
    if (contin) {
      circles.push(pos);
      ellipse(x,y,r*2,r*2);
    }

    protection++;

    if (protection > 500) {
      break;
    }
  }
  print(circles);


}

function draw() {

}

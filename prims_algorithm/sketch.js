var vertices = [];

function setup() {
  createCanvas(600,400);

  // for (var i = 0; i < 20; i++) {
  //   var p = createVector(random(width), random(height));
  //   vertices.push(p);
  // }
}

function mousePressed() {
  var point = createVector(mouseX,mouseY);
  vertices.push(point);
}

function draw() {
  var reached = [];
  var unreached = [];
  background(150);

  for (var i = 0; i < vertices.length; i++) {
    unreached.push(vertices[i]);
  }

  reached.push(unreached[0]);
  unreached.splice(0,1);


  while(unreached.length > 0) {
    var rIndex;
    var uIndex;
    var boundries = 1000;

    for (var i = 0; i <reached.length; i++){
      for(var j = 0; j<unreached.length;j++){

        var d = dist(reached[i].x,reached[i].y,unreached[j].x,unreached[j].y);
        if (d<boundries) {
          boundries = d;
          rIndex = i;
          uIndex = j;
        }

      }


    }
    line(reached[rIndex].x,reached[rIndex].y,unreached[uIndex].x, unreached[uIndex].y);
    reached.push(unreached[uIndex]);
    unreached.splice(uIndex,1);
  }

  for (var i = 0; i < vertices.length; i++) {
    fill(0, 150);
    ellipse(vertices[i].x, vertices[i].y, 10, 10);
  }

}

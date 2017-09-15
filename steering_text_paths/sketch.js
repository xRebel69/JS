var font;
function preload() {
  font = loadFont('AvenirNextLTPro-Demi.otf');
}

function setup() {
  createCanvas(600,200);
  background(51);
  // textSize(180);
  // text('Zyad', 50, 150);

  var points = font.textToPoints('Zyad', 50, 150, 180);
  console.log(points);
  for (var i = 0; i < points.length; i++) {
    fill(255,0,0);
    strokeWeight(9);
    point(points[i].x, points[i].y);
  }

}

function draw() {

}

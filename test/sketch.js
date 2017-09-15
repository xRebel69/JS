function setup() {
  createCanvas(600,400);
  //createCapture(VIDEO);
}

function draw() {

  loadPixels();

  for(var y = 0; y < width; y++) {
    for(var x = 0; x <height; x++) {
      var pixel = (x + y*width) * 4;
      pixels[pixel+0] = random(255);
      pixels[pixel+1] = random(255);
      pixels[pixel+2] = random(255);
      pixels[pixel+3] = random(255);
    }
  }

  updatePixels();
}

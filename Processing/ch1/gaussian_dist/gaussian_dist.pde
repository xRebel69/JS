import java.util.Random;

Random ran;
void setup() {
  size(600, 200);
  background(160);
  ran = new Random();
}

void draw() {
  float h = (float) ran.nextGaussian();
  h = h * 100;
  h = h + 300;

  //print(h);
  fill(10, 20);
  noStroke();
  ellipse(h, height/2, 20, 20);
}
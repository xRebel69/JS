
Ball b;
void setup() {
  size(600, 400);

  b = new Ball();
}

void draw() {
  background(51);

  PVector gravity = new PVector(0, 0.2);
  b.addForce(gravity);

  PVector wind = new PVector(0.1, 0);
  b.addForce(wind);
  
  b.walls();
  b.update();
  
  b.show();
}
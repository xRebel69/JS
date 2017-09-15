
Ball[] balls;
void setup() {
  size(600, 400);

  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(51);

  for (Ball b : balls) {
    PVector gravity = new PVector(0, 0.2);
    gravity.mult(b.mass);

    b.addForce(gravity);

    PVector wind = new PVector(0.1, 0);
    b.addForce(wind);

    b.walls();
    b.update();

    b.show();
  }
}

Ball b;
void setup() {
  size(600, 400);

  b = new Ball();
}

void draw() {
  background(51);

  //Gravity
  PVector gravity = new PVector(0, 0.2);
  gravity.mult(b.mass);
  b.addForce(gravity);

  //Wind
  PVector wind = new PVector(0.1, 0);
  //b.addForce(wind);

  //Friction
  PVector friction = b.velocity.get();
  friction.normalize();
  friction.mult(-1);
  float c1 = 0.2;
  friction.mult(c1);

  //Drag
  PVector drag = b.velocity.get();
  drag.normalize();
  drag.mult(-1);
  float speed = b.velocity.mag();
  float c2 = 0.1;
  drag.mult(c2*speed*speed);
  if (mousePressed) {
    b.addForce(drag);
  }

  b.walls();
  b.update();
  b.show();
}
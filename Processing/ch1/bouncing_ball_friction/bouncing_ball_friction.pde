
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
  b.addForce(wind);

  //Friction
  PVector friction = b.velocity.get();
  friction.normalize();
  friction.mult(-1);
  float c = 0.2;
  friction.mult(c);
  
  
  if(mousePressed){
    b.addForce(friction);
  }
  
  b.walls();
  b.update();
  b.show();
}
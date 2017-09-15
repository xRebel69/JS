class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Ball() {
    position = new PVector(random(width), height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1,3);
  }

  void walls() {
    if ((position.x<0) || (position.x>width)) {
      velocity.x *= -1;
    }
    if ((position.y>height) || (position.y<0)) {
      velocity.y *= -1;
    }

  }
  void addForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {

    velocity.add(acceleration);
    position.add(velocity);
    //velocity.limit(3);
    acceleration.mult(0);
  }

  void show() {
    fill(255, 59);
    noStroke();
    ellipse(position.x, position.y, mass*20, mass*20);
  }
}
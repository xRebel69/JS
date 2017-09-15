class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255;

  Particle(PVector loc) {
    location = loc;
    velocity = new PVector(random(-2, 2), random(-3, 0));
    acceleration = new PVector(0, 0.05);
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    lifespan -= random(1,4);
  }
  boolean isDead() {
    if (lifespan<=0) 
      return true;
    else 
      return false;
  }
  void display() {
    noStroke();
    stroke(0, lifespan);
    fill(255, lifespan);
    ellipse(location.x, location.y, 20, 20);
  }
}
class SquareParticle extends Particle {
  float angle;
  float aVel;
  float aAcc;
  
  SquareParticle (PVector loc) {
    super(loc);
    angle = 0;
    aVel = 0;
    aAcc = random(1) > 0.5? 0.001: -0.001;
  }
  void update() {
    angle += aVel;
    aVel += aAcc;
    super.update();
  }

  void display() {
    stroke(0, lifespan);
    fill(255, lifespan);
    pushMatrix();
        translate(location.x, location.y);

    rotate(angle);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}
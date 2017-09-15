class TriangleParticle extends Particle {
  float r = random(10, 20);
  float angle;
  float aVel;
  float aAcc;

  TriangleParticle(PVector loc) {
    super(loc);
    angle = 0;
    aVel = 0;
    aAcc = random(1) > 0.5? 0.001: -0.001;
  }
  
  void update(){
    angle += aVel;
    aVel += aAcc;
    super.update();
    
  }

  void display() {
    float xoff = cos(30*(PI/180)) * r;
    float yoff = sin(30*(PI/180)) * r;

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    PVector top = new PVector(0, 0 - r);
    PVector right = new PVector(0+xoff, 0+yoff);
    PVector left = new PVector(0-xoff, 0+yoff);
      
    stroke(0, lifespan);
    fill(255, lifespan);
    triangle(top.x, top.y, right.x, right.y, left.x, left.y);
    
    popMatrix();
  }
}
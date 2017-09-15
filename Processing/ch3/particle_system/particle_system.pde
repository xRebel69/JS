ArrayList<particleSystems> ps;

void setup() {
  size(500, 500);
  ps = new ArrayList<particleSystems>();
  //ps.add(new particleSystems(new PVector((width/2), (height/2))));
}

void draw() {
  background(50);
  for (particleSystems p : ps) {
    p.addParticle();
    p.run();
    
    PVector wind = new PVector(0.2, 0);
    //p.applyForce(wind);
    
    PVector gravity = new PVector(0, 0.1);
    p.applyForce(gravity);
  }
  
}

void mousePressed(){
    ps.add(new particleSystems(new PVector(mouseX, mouseY)));

}
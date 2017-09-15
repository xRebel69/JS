class particleSystems {
  ArrayList<Particle> particles;
  PVector origin;

  particleSystems(PVector loc) {
    particles = new ArrayList<Particle>();
    origin = loc;
  }

  void applyForce(PVector force){
    for(Particle p: particles){
      p.applyForce(force);
    }
  }
  void addParticle() {
    float option = floor(random(3));
    if (option == 2)
      particles.add(new SquareParticle(new PVector(origin.x, origin.y)));
    else if (option == 1)
      particles.add(new Particle(new PVector(origin.x, origin.y)));
    else
      particles.add(new TriangleParticle(new PVector(origin.x, origin.y)));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
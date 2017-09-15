ArrayList<Particle> particles;

void setup() {
  size(500, 500);
  particles = new ArrayList<Particle>();

}

void draw() {
  background(50);
  particles.add(new Particle(new PVector(width/2, height/2)));

  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();

    if (p.isDead()) {
      particles.remove(i);
    }
  }
  println(particles.size());
}
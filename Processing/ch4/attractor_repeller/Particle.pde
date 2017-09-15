class Particle extends VerletParticle2D {
  Particle (Vec2D loc) {
    super(loc);

    AttractionBehavior p = new AttractionBehavior(this, 20, -2);
    physics.addParticle(this);
    //physics.addBehavior(p);
  }
  void display() {
    fill(255,0,0);
    ellipse(x, y, 30, 30);
  }
}
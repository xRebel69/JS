class Attractor extends VerletParticle2D {
  float radius = 20;
  Attractor (Vec2D loc) {
    super(loc);

    AttractionBehavior p = new AttractionBehavior(this, 500, 1);
    AttractionBehavior p1 = new AttractionBehavior(this, radius+20, -12);

    physics.addParticle(this);
    physics.addBehavior(p);
    physics.addBehavior(p1);
  }
  void display() {
    fill(255);

    ellipse(x, y, radius, radius);
  }
}
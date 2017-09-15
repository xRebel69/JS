class Particle extends VerletParticle2D{
  Particle(Vec2D l){
    super(l);
  }
  void display(){
    ellipse(x,y,23,23);
  }
}
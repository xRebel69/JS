import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
Attractor attractor;

ArrayList<Particle> particles;
void setup(){
  size(500,500);
  physics= new VerletPhysics2D();
  
  //physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  physics.setWorldBounds(new Rect(0, 0, width, height));
  attractor = new Attractor(new Vec2D(width/2, height/2));
  attractor.lock();
  physics.addParticle(attractor);
  particles = new ArrayList<Particle>();
  
  for (int i = 0; i < 4; i++){
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  }
  
}
void draw() {
  background(51);
  physics.update();
  
  attractor.display();
  for (Particle p: particles){
    p.display();
  }
}
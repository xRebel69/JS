
Ball[] balls;
void setup() {
  size(1300, 700);

  balls = new Ball[10];
  
  balls[0] = new Ball();
  //balls[0].custom();

  for(int i = 1; i < balls.length; i++) {
    balls[i] = new Ball();
  }

}

void draw() {
  background(51);

  /*
  //Gravity
  PVector gravity = new PVector(0, 0.2);
  //gravity.mult(b.mass);
  //b.addForce(gravity);

  //Wind
  PVector wind = new PVector(0.1, 0);
  //b.addForce(wind);

  //Friction
  PVector friction = b.velocity.get();
  friction.normalize();
  friction.mult(-1);
  float c1 = 0.2;
  friction.mult(c1);

  //Drag
  PVector drag = b.velocity.get();
  drag.normalize();
  drag.mult(-1);
  float speed = b.velocity.mag();
  float c2 = 0.1;
  drag.mult(c2*speed*speed);
    //b.addForce(drag);
*/

  for (Ball b: balls) {
    for (Ball b2: balls) {
      if (b!=b2){
      PVector forc = b2.attract(b);
      b.addForce(forc);
      }
    }
      b.update();

  //b.walls();
  b.show();
  }
}
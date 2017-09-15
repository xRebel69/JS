import fisica.*;

ArrayList<Ball> balls;
FWorld world;
Motor motor;

void setup(){
  size(500,500);
  balls = new ArrayList<Ball>();
  
  Fisica.init(this);
  
  world = new FWorld();
  motor = new Motor();

  world.setEdges(0,0,width,height);
}

void draw(){
    background(51);

    world.step();
    world.draw(this);
    
  if(frameCount % 10 == 0){
    balls.add(new Ball((width/2)+random(-100,100), -20));
    getbodies();
  }
  deleteBodies();
}

void mousePressed(){
      balls.add(new Ball(mouseX, mouseY));
  motor.switchMotor();
}

void contactStarted(FContact c){
  FBody b1;
  FBody b2;
  
  b1 = c.getBody1();
  b2 = c.getBody2();
  
  if (b1 instanceof FCircle && b2 instanceof FCircle) {
    b1.setFill(0,255,0);
    b2.setFill(0,255,0);
  }
}

void contactEnded(FContact c){
  FBody b1;
  FBody b2;
  
  b1 = c.getBody1();
  b2 = c.getBody2();
  
  if (b1 instanceof FCircle && b2 instanceof FCircle) {
    b1.setFill(255);
    b2.setFill(255);
  }
}

void getbodies(){
  println(world.getBodies().size());
}

void deleteBodies(){
  ArrayList<FBody> f = world.getBodies();
  for(FBody b: f){
    if (b.getY() >height)
      world.removeBody(b);
  }
  
}
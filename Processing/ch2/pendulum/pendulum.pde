PVector origin;
PVector arm;
float len = 240;
float a = PI/4;
float aVel = 0;
float aAcc = 0;


void setup() {
  size(600, 300);
  origin = new PVector(width/2, 0);
  arm = new PVector(width/2, len);
  //frameRate(10);
}

void draw() {
  background(50);
  arm.x = origin.x + len*sin(a);
  arm.y = origin.y + len*cos(a);
  
  line (origin.x, origin.y, arm.x, arm.y);
  ellipse(arm.x, arm.y, 20, 20);
  
  aAcc = (-0.4/len)*sin(a);
  
  a += aVel;
  aVel += aAcc;
  aVel *= 0.995;
}
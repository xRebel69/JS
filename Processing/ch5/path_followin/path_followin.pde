Path p;
ArrayList<Vehicle> vs;
void setup() {
  size(600, 400);
  p = new Path();
  vs = new ArrayList<Vehicle>();

  for (int i = 0; i < 10; i++)
    vs.add(new Vehicle(new PVector(random(width), random(height))));
}

void draw() {
  background(255);

  for (Vehicle v : vs) {
    v.display();
    v.wrap();
    v.update();
    v.followPath(p);
  }

  p.display();
}

void mouseDragged() {
  vs.add(new Vehicle(new PVector(mouseX, mouseY)));
}

void keyPressed(){
  if(key == ' '){
    p.changeLine();
  }
}
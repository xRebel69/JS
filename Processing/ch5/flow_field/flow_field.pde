Vehicle[] v;
FlowField f;
boolean debug;
void setup() {
  size(600, 400);
  v = new Vehicle[100];//(new PVector(width/2, height/2));

  for (int i =0; i <v.length; i++) {
    v[i] = new Vehicle(new PVector(random(width), random(height)));
  }

  f = new FlowField(10);
  f.init();

  debug = true;
  //frameRate(1);
}

void draw() {
  background(170);
  if (debug)
    f.display();

  for (int i =0; i <v.length; i++) {
    v[i].display();
    v[i].follow(f);
    v[i].update();
  }
  //v.seek(new PVector(mouseX, mouseY));

  //v.applyForce(new PVector(0.01, 0));
}
void mousePressed() {
  f.init();
}
void keyPressed() {
  if (key == ' ')
    debug = !debug;
}
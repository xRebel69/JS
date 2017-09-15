Vehicle v;

void setup() {
  size(600, 400);
  v = new Vehicle(new PVector(width/2, height/2));
}

void draw() {
  background(51);
  v.display();
  v.seek(new PVector(mouseX, mouseY));

  v.update();
  v.applyForce(new PVector(0.01, 0));
}
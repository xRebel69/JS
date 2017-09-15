ArrayList<Vehicle> vs;

void setup() {
  size(1000, 600);
  vs = new ArrayList<Vehicle>();
}

void draw() {
  background(51);

  for (Vehicle v : vs) {
    v.display();
    v.applyBehaviors(vs);

    v.update();
    v.wrap();
  }
}

void mouseDragged() {
  vs.add(new Vehicle(new PVector(mouseX, mouseY)));
}
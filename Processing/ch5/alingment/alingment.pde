ArrayList<Vehicle> vs;

void setup() {
  size(600, 400);
  vs = new ArrayList<Vehicle>();
}

void draw() {
  background(51);

  for (Vehicle v : vs) {
    v.display();
    v.align(vs);

    v.update();
    v.wrap();
  }
}

void mouseDragged() {
  vs.add(new Vehicle(new PVector(mouseX, mouseY)));
}

Ball b;
void setup() {
  size(600,400);
  b = new Ball();
}

void draw() {
  background(51);
  b.update();
  b.show();
}
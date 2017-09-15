class Walker {
  int x, y;

  Walker() {
    x=width/2;
    y=height/2;
  }

  void show() {
    fill(0);
    point(x, y);
  }

  void update() {
    int random = floor(random(100));

    if (random < 30) {
      x += 1;
    } else if (random < 60) {
      y -= 1;
    } else if (random < 80) {
      y += 1;
    } else {
      x -= 1;
    }

    x = constrain(x, 10, width-10);
    y  =constrain(y, 10, height-10);
  }
}

Walker w;
void setup() {
  size(500, 500);
  background(151);
  w = new Walker();
}
void draw() {
  w.show();
  w.update();
}
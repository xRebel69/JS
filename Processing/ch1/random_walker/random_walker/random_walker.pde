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
    int random = floor(random(4));

    if (random ==0) {
      x += 1;
    } else if (random ==1) {
      x -= 1;
    } else if (random == 2) {
      y += 1;
    } else if (random == 3) {
      y -= 1;
    }

    x = constrain(x, 0, width);
    y  =constrain(y, 0, height);
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
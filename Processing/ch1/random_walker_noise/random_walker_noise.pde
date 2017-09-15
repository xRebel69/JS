class Walker {
  float x, y;
  float prevX, prevY;
  float tx = 0;
  float ty = 1000;

  Walker() {
    x = map(noise(tx), 0 ,1, 0, width);
    y = map(noise(ty), 0 ,1, 0, height);
  }

  void show() {
    fill(0);
    line(x, y, prevX,prevY);
  }

  void update() {
    prevX = x;
    prevY = y;
    x = map(noise(tx), 0 ,1, 0, width);
    y = map(noise(ty), 0 ,1, 0, height);
    tx += 0.1;
    ty += 0.1;
    
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
}

Walker w;
void setup() {
  size(500, 500);
  background(151);
  w = new Walker();
}
void draw() {
  w.update();
  w.show();
  
}
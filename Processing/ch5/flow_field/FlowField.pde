class FlowField {
  PVector [][] field;
  int cols, rows;
  int resolution;


  FlowField(int reso) {
    resolution = reso;
    cols = width/resolution;
    rows = width/resolution;

    field = new PVector[cols][rows];
    init();
  }

  void init() {
    noiseSeed((int)random(1000));
    float xoff = 0;
    for (int i = 0; i<cols; i++) {
      float yoff = 0;
      for (int j = 0; j<rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, 2*PI);

        field[i][j] = new PVector(1*cos(theta), 1*sin(theta));
        yoff +=0.01;
      }
      xoff +=0.01;
    }
  }

  void display() {
    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows; j++) {
        drawVector(field[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  void drawVector(PVector v, float x, float y, float scl) {
    pushMatrix();
    translate(x, y);
    stroke(0,100);
    rotate(v.heading());
    float len = v.mag()*scl;
    line (0, 0, len, 0);
    popMatrix();
  }

  PVector lookup (PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return new PVector(field[column][row].x ,field[column][row].y);
  }
}
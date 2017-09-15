class Path {
  PVector start;
  PVector end;
  float radius;

  Path() {
    radius = 30;
    start = new PVector(0, height/2);
    end = new PVector(width, height/3);
  }

  void display() {
    stroke(200, 100);
    strokeWeight(50);
    line(start.x, start.y, end.x, end.y);

    stroke(0);
    strokeWeight(1);
    line(start.x, start.y, end.x, end.y);
  }
  
  void changeLine(){
    start = new PVector(0, random(height));
    end = new PVector(width, random(height));
  }
}
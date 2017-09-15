void setup() {
  size(500, 500);
  x = random(width);
  y = random(height);
}
float x, y;
float xspeed = 3;
float yspeed = 3;
int size = 30;
void draw() {
  background(51);
  if ((x > width-(size/2)) ||(x < 0+(size/2))) {
    xspeed *= -1;
  }
  if ((y > height-(size/2)) ||(y < 0+(size/2))) {
    yspeed *= -1;
  }

  x += xspeed;
  y += yspeed;
  
  ellipse(x, y, size, size);
}
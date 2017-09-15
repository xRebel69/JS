class Ball {
  PVector position;
  PVector velocity;

  Ball() {
    position = new PVector(random(width),random(height));

    velocity = new PVector(2, -2.5);
  }
  
  void update() {
    if ((position.x<0) || (position.x>width)) {
      velocity.x *= -1;
    }
    if ((position.y<0) || (position.y>height)) {
      velocity.y *= -1;
    }
    
    position.add(velocity);
  }
  
  void show() {
    fill(255);
    noStroke();
    ellipse(position.x, position.y , 15, 15);
  }
}
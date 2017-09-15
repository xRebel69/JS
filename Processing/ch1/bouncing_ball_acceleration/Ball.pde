class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;

  Ball() {
    position = new PVector(random(width),random(height));
    velocity = new PVector(-2, 0);
    acceleration = new PVector(0,0.5);
    
  }
  
  void walls() {
    if ((position.x<0) || (position.x>width)) {
      velocity.x *= -1;
    }
    if ((position.y<0) || (position.y>height)) {
      velocity.y *= -1;
    }
  }
  
  
  void update() {
    
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(0.1);
    
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(3);
    
    acceleration = mouse;
  }
  
  void show() {
    fill(255, 59);
    noStroke();
    ellipse(position.x, position.y , 15, 15);
  }
}
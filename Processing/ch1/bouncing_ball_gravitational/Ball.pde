class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean customToggle = false;
  
  Ball() {
    mass = random(1,3);
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }
  PVector attract(Ball other){
    PVector gravitational = PVector.sub(position, other.position);
    float d = gravitational.mag();
    d = constrain(d, 5, 25);
    gravitational.normalize();
    float G = 1;
    float magnitude = (G * mass * other.mass)/ (d*d);
    
    gravitational.mult(magnitude);
    return gravitational;
    
  }

  void walls() {
    if ((position.x<0) || (position.x>width)) {
      velocity.x *= -1;
      position.x = width;
    }
    if ((position.y>height) || (position.y<0)) {
      velocity.y *= -1;
      position.y = height;
    }

  }
  void addForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {

    velocity.add(acceleration);
    position.add(velocity);
    //velocity.limit(3);
    acceleration.mult(0);
  }

  void show() {
    fill(255, 59);
    noStroke();
    if (customToggle) {
    ellipse(position.x, position.y, 10, 10);
    }
    else{
     ellipse(position.x, position.y, mass*20, mass*20);

    }
  }
  void custom(){
    customToggle = true;
    position.x = width/2;
    position.y = height/2;
    mass = 300;
  }
}
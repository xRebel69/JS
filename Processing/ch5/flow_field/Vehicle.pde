class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed = 3;
  float maxforce = 0.1;
  Vehicle(PVector loc) {
    location = new PVector(loc.x, loc.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void follow(FlowField f) {
    PVector desired = f.lookup(location);
    desired.mult(maxspeed);

    PVector steering = PVector.sub(desired, velocity);
    steering.limit(maxforce);

    applyForce(steering);
  }
  
  void seek(PVector target) {
    //steering = desiered - velocity
    // desired = target - location



    PVector desired = PVector.sub(target, location);
    float d = desired.mag();
    if (d < 100) {
      float speed = map(d, 0, 100, 0, maxspeed);
      desired.setMag(speed);
    } else {
      desired.setMag(maxspeed);
    }

    PVector steering = PVector.sub(desired, velocity);
    steering.limit(maxforce);

    acceleration.add(steering);
  }

  void update() {
    wrap();
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  void display() {

    fill(255);
    float angle = velocity.heading() + PI + PI/2;

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    triangle (0, 0+10, 0 -5, 0-5, 0 +5, 0 -5);
    popMatrix();
  }
  void wrap(){
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;

  }
  
}
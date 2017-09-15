class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed = 4;
  float maxforce = 0.1;
  Vehicle(PVector loc) {
    location = new PVector(loc.x, loc.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
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
    location.add(velocity);
    velocity.add(acceleration);
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
    triangle (0, 0+20, 0 -10, 0-10, 0 +10, 0 -10);
    popMatrix();
  }
}
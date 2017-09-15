class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce = 0.2;
  Vehicle(PVector loc) {
    location = new PVector(loc.x, loc.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxspeed = 3;

    randomVel();
  }
  void randomVel() {
    velocity.x = random(-4, 4);
    velocity.y = random(-4, 4);
  }

  void flee(ArrayList<Vehicle> boids) {
    float awarenessRadius = 30;
    PVector sum = new PVector(0, 0);

    int count = 0;

    for (Vehicle v : boids) {
      float d = location.dist(v.location);

      if (d>0 && d<awarenessRadius) {
        PVector diff = PVector.sub(location, v.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      
      sum.setMag(maxspeed);
      PVector steering = PVector.sub(sum, velocity);
      steering.limit(maxforce);
      applyForce(steering);
    }
  }

  void align(ArrayList<Vehicle> boids) {
    float awarenessRadius = 40;
    PVector avgVel = new PVector(0, 0);
    int count = 0;

    for (Vehicle v : boids) {

      float dist = location.dist(v.location);
      if (dist > 0 && dist < awarenessRadius) {
        avgVel.add(v.velocity);
        count++;
      }
    }

    if (count > 0) {
      avgVel.div(count);
      PVector desired = avgVel.get();
      desired.setMag(maxspeed);
      PVector steering = PVector.sub(desired, velocity);
      steering.limit(maxforce);
      applyForce(steering);
    }
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
  void wrap() {
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;
  }
}
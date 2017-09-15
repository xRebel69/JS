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

  void align(ArrayList<Vehicle> boids) {
    float awarenessRadius = 30;
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
  //void followPath(Path p){
  //  // predict the location 
  //  PVector predict = velocity.get();
  //  predict.setMag(50);
  //  PVector predictLoc = PVector.add(location, predict);

  //  //look at the path (line)
  //  PVector a = p.start;
  //  PVector b = p.end;

  //  //get the normal point
  //  PVector normalPoint = getNormalPoint(predictLoc, a, b);

  //  //Find targe point further ahead of normal
  //  PVector dir = PVector.sub(b,a);
  //  dir.setMag(10);   
  //  PVector target = PVector.add(normalPoint, dir);

  //  float distance = PVector.dist(predictLoc, normalPoint);
  //  if (distance > p.radius){
  //    seek(target);
  //  }
  //}

  PVector getNormalPoint(PVector m, PVector startLine, PVector endLine) {
    PVector path = PVector.sub(startLine, endLine);
    path.normalize();

    path.mult(path.dot(m));
    path.add(startLine);

    PVector normalPoint = path.get();
    return normalPoint;
  }

  //void flow(FlowField f) {
  //  PVector desired = f.lookup(location);
  //  desired.mult(maxspeed);

  //  PVector steering = PVector.sub(desired, velocity);
  //  steering.limit(maxforce);

  //  applyForce(steering);
  //}

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
  void wrap() {
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;
  }
}
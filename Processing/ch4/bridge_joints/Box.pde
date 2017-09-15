class Box {
  FBox box, box1;
  FCircle circle;

  Box(float x, float y) {
    box = new FBox(random(10, 20), random(10, 20));
    circle = new  FCircle(random(10, 20));

    box.setPosition(x, y);
    box.setVelocity(random(-10, 10), random(-10, 10));
    circle.setPosition(x, y);
    circle.setVelocity(random(-200, 200), -200);

   // world.add(box);
    world.add(circle);
    // world.add(poly);
  }
}
class Box {
  FBox box, box1;
  FCircle circle;
  FPoly poly;
  Box(float x, float y) {
    box = new FBox(random(10, 20), random(10, 20));
    poly = new FPoly();
    circle = new  FCircle(random(10, 20));

    FDistanceJoint j = new FDistanceJoint(box, circle);
    j.setLength(50);
    poly.vertex(x+15, y+19);
    poly.vertex(x+7, y+3);
    poly.vertex(x+4, y-7);
    poly.vertex(x-10, y-2);

    box.setPosition(x+50, y);
    circle.setPosition(x, y);
    poly.setPosition(x, y);

    world.add(box);
    world.add(circle);
    world.add(j);
   // world.add(poly);
  }
}
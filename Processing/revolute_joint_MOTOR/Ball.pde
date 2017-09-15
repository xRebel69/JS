class Ball {
  FCircle circle;
  
  Ball(float x, float y) {

    circle = new  FCircle(random(10, 20));
    circle.setPosition(x, y);


    world.add(circle);
  }
}
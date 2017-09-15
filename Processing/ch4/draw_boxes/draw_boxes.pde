import fisica.*;

ArrayList<Box> boxes;
FWorld world;

void setup(){
  size(500,500);
  boxes = new ArrayList<Box>();
  
  Fisica.init(this);
  
  world = new FWorld();
  //world.setEdges();
  
  FBox obstacle = new FBox(100, 20);
  obstacle.setPosition(width/2, height/2);
  obstacle.setStatic(true);
  obstacle.setFill(255,33,33);
  obstacle.setGrabbable(false);
  world.add(obstacle);
}

void draw(){
    background(51);
    world.step();
    world.draw(this);
    
  //if(mousePressed){
  //  boxes.add(new Box(mouseX, mouseY));
  //}
}

void mousePressed(){
      boxes.add(new Box(mouseX, mouseY));

}
import fisica.*;

ArrayList<Box> boxes;
FWorld world;

void setup() {
  size(1000, 500);
  boxes = new ArrayList<Box>();

  Fisica.init(this);

  world = new FWorld();
  //world.setEdges();

  setBridge();
}

void draw() {
  background(51);
  world.step();
  world.draw(this);

  if(mousePressed){
    boxes.add(new Box(mouseX, mouseY));
  }
}

void mousePressed() {
  boxes.add(new Box(mouseX, mouseY));
}

void setBridge() {
  ArrayList<FCircle> bridge = new ArrayList<FCircle>();

  FCircle leftCircle = new FCircle(10);
  leftCircle.setPosition(0, height/2);
  leftCircle.setStatic(true);
  leftCircle.setFill(255, 0, 0);
  leftCircle.setGrabbable(false);
  bridge.add(leftCircle);
  //world.add(leftCircle);

  int size = width/10;
  for (int i =0; i < size; i++) {
    FCircle circ = new FCircle(10);
    float sep = width/(size+1);
    circ.setPosition(sep*(i+1), height/2);
    bridge.add(circ);
  }

  FCircle rightCircle = new FCircle(10);
  rightCircle.setPosition(width, height/2);
  rightCircle.setStatic(true);
  rightCircle.setFill(255, 0, 0);
  rightCircle.setGrabbable(false);
  bridge.add(rightCircle);

  world.add(rightCircle);

  
  for (int i = 0; i <bridge.size()-1; i ++) {
    world.add(bridge.get(i));
  }
  
  for (int i = 0; i <bridge.size()-1; i ++) {
    FDistanceJoint f = new FDistanceJoint(bridge.get(i), bridge.get(i+1));
    f.setLength(0);
    world.add(f);
    print();
  }
}
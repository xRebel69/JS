// module aliases
var Engine = Matter.Engine,
  //Render = Matter.Render,
  World = Matter.World,
  Bodies = Matter.Bodies;

// create an engine
var engine = Engine.create();
var ground;
var boxes = [];
var boundires = [];
function setup() {
  createCanvas(600, 450);

  boundires.push(new Boundary(250,100,300,15,0.3));
  boundires.push(new Boundary(350,350,450,15,-0.3));

  // run the engine
  //Engine.run(engine);
}

function draw() {
  background(51);

Engine.update(engine);
  rectMode(CENTER);
  fill(150);

  for(var i =0; i<boxes.length; i++) {
    boxes[i].display();
  }
  for(var i =0; i<boundires.length; i++) {
    boundires[i].display();
  }
}

function mousePressed(){
  var b = random() > 0.5? new Box(mouseX, mouseY, random(10,60),random(10,60)) : new Circle(mouseX, mouseY, random(5,20))  ;
  boxes.push(b);
}

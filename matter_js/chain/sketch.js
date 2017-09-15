// module aliases
var Engine = Matter.Engine,
  //Render = Matter.Render,
  World = Matter.World,
  Bodies = Matter.Bodies,
  Mouse = Matter.Mouse,
  MouseConstraint = Matter.MouseConstraint,
  Constraint = Matter.Constraint;

// create an engine
var engine = Engine.create();
var ground;
var circles = [];

var mConstraint;

function setup() {
  var canvas = createCanvas(600, 450);

  var prev = null;

  for (var x = 300; x < 500; x+=20) {
    var p = new Circle(x, 50, 20,);

    if (prev){
      var p = new Circle(x, 50, 10,false);

      var options = {
        bodyA: p.body,
        bodyB: prev.body,
        stiffness: 0.5,
        length: 20
      }

      var constraint = Constraint.create(options);
      World.add(engine.world, constraint);
    } else {
      var p = new Circle(x, 50, 10,true);
    }
    circles.push(p);

    prev = p;
  }


  var canvasmouse = Mouse.create(canvas.elt);
  //canvasmouse.pixelRatio = (pixelDensity());

  var options1 = {
    mouse: canvasmouse
  }

  mConstraint = MouseConstraint.create(engine, options1);
  console.log(mConstraint);
  World.add(engine.world, mConstraint);


}

function draw() {
  background(51);

Engine.update(engine);
  rectMode(CENTER);
  fill(150);

  for(var i =0; i<circles.length; i++) {
    circles[i].display();
  }

  if(mConstraint.body) {
    console.log(mConstraint.body);
  }
}

function mousePressed(){
  //var b = new Circle(mouseX, mouseY, random(5,20));
  //boxes.push(b);
  console.log(mConstraint);

}

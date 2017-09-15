var snake;

function setup() {
  createCanvas(600,600);
  snake = new Snake();
  pickCell(food);

  frameRate(10)
}

var food = {
  x : 0,
  y : 0
}

function pickCell(object) {
var cols = floor(width/scl);
var rows = floor(height/scl);

object.x = floor(random(cols))*scl;
object.y = floor(random(rows))*scl;

}

function draw() {
  background(51);
  snake.update();
  if(snake.death()) {
    console.log("you died");
    noLoop();
  }
  snake.show();
  drawGrid();


  //food checking
  fill(255,0,0);
  if (snake.eat(food)) {
    pickCell(food);
  }
  rect(food.x, food.y, scl, scl);

}


function drawGrid() {
  for (var i = 0; i < width; i += scl) {
    stroke(0);
    line(i,0,i,height);
  }
  for (var i = 0; i < height; i += scl) {
    stroke(0);
    line(0, i, width, i);
  }
}

function keyPressed() {
  if (keyCode === UP_ARROW) {
    snake.direction(0, -1);
    console.log("Up")
  } else if (keyCode === DOWN_ARROW) {
    snake.direction(0, 1);
    console.log("Down");
  } else if (keyCode === RIGHT_ARROW) {
    snake.direction(1, 0);
    console.log("Right");
  } else if (keyCode === LEFT_ARROW) {
    snake.direction(-1, 0);
    console.log("LEFT");
  }
}

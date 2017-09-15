var cols, rows;
var w = 10;
var grid = [];
var stack = [];
var current;

function setup() {
  createCanvas(400, 400);

  cols = floor(width / w);
  rows = floor(height / w);

  for (var j = 0; j < cols; j++) {
    for (var i = 0; i < rows; i++) {
      var cell = new Cell(i, j);
      grid.push(cell);
    }
  }
  current = grid[0];
}

function draw() {
  background(51);
  for (var i = 0; i < grid.length; i++) {
    grid[i].show();
  }

  for (var i = 0; i < stack.length; i++) {
    stack[i].highlight(color(255,0,0,100));
  }

  current.visited = true;
  current.highlight(color(0,255,0));
  //Step1
  var next = current.checkNeighbors();
  if (next) {
    next.visited = true;

    //Step2
    stack.push(current);

    //Step3
    removeWalls(current, next);

    //Step4
    current = next;
  } else if (stack.length > 0) {
    current = stack.pop();
  }
}

function removeWalls(a, b) {
  var x = a.i - b.i;

  if (x == 0) {
    var y = a.j - b.j;
    if (y == -1) {
      a.walls[2] = false;
      b.walls[0] = false;
    } else {
      a.walls[0] = false;
      b.walls[2] = false;
    }
  } else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  } else {
    a.walls[3] = false;
    b.walls[1] = false;
  }
}


function index(i, j) {
  if (i < 0 || j < 0 || i > cols - 1 || j > rows - 1) {
    return -1;
  } else {
    return (i + j * cols);
  }
}

function Cell(i, j) {
  this.i = i;
  this.j = j;
  this.visited = false;

  //walls[0] -> top | walls[1] -> right | walls[2] -> bot | walls[3] -> left
  this.walls = [true, true, true, true];



  this.checkNeighbors = function() {
    var neighbors = [];

    var top = grid[index(i, j - 1)];
    var right = grid[index(i + 1, j)];
    var bot = grid[index(i, j + 1)];
    var left = grid[index(i - 1, j)];

    if (top && !top.visited) {
      neighbors.push(top);
    }
    if (right && !right.visited) {
      neighbors.push(right);
    }
    if (bot && !bot.visited) {
      neighbors.push(bot);
    }
    if (left && !left.visited) {
      neighbors.push(left);
    }

    if (neighbors.length > 0) {
      return random(neighbors);
    } else {
      return;
    }
  }

  this.highlight = function(col) {
    var x = this.i * w;
    var y = this.j * w;
    fill(col);
    noStroke();
    rect(x, y, w, w);
  }

  this.show = function() {
    stroke(255);
    noFill();
    var x = this.i * w;
    var y = this.j * w;

    // top
    if (this.walls[0]) {
      var top = line(x, y, x + w, y);
    }

    // right
    if (this.walls[1]) {
      var right = line(x + w, y, x + w, y + w);
    }

    // bot
    if (this.walls[2]) {
      var bot = line(x, y + w, x + w, y + w);
    }

    // left
    if (this.walls[3]) {
      var left = line(x, y, x, y + w);
    }

    if (this.visited) {
      fill(200, 0, 200, 100);
      noStroke();
      rect(x, y, w, w);
    }
  }
}

function make2DArray(cols, rows) {
  var arr = new Array(cols);
  for (var i = 0; i < arr.length; i++) {
    arr[i] = new Array(rows);
  }

  return arr;
}

var grid;
var scl = 40;
var cols;
var rows;
function setup() {
  createCanvas(401, 401);

  cols = floor(width/scl);
  rows = floor(height/scl)
  grid = make2DArray(cols ,rows);

  for(var i = 0; i < grid.length; i++) {
    for(var j = 0; j < grid[i].length; j++) {
      grid[i][j] = new Cell(i*scl, j*scl, scl);
    }
  }

  //add mines
  var noOfmines = 20;
  for (var n = 0; n < noOfmines; n++) {
    var i = floor(random(cols));
    var j = floor(random(rows));

    if (grid[i][j].mine) {
      n--;
    } else {
      grid[i][j].mine = true;
    }
  }

  for(var i = 0; i < grid.length; i++) {
    for(var j = 0; j < grid[i].length; j++) {
      grid[i][j].nearbyMines();
    }
  }
}

function draw() {
  background(255);
  for(var i = 0; i < grid.length; i++) {
    for(var j = 0; j < grid[i].length; j++) {
      grid[i][j].show();
    }
  }
}

function mousePressed() {
  for(var i = 0; i < grid.length; i++) {
    for(var j = 0; j < grid[i].length; j++) {
      if (grid[i][j].contains(mouseX, mouseY)) {
        if(grid[i][j].mine) {
          gameOver();
        }
        grid[i][j].reveal();
      }
    }
  }
}

function gameOver() {
  for(var i = 0; i < grid.length; i++) {
    for(var j = 0; j < grid[i].length; j++) {
      grid[i][j].revealed = true;
    }
  }
  console.log("GameOver");
}

function Cell(x, y, scl){
  this.x = x;
  this.y = y;
  this.i = x/scl;
  this.j = y/scl;
  this.revealed = false;
  this.number = -5;
  this.mine = false;
}

Cell.prototype.show = function() {
  stroke(0);
  noFill();
  rect(this.x, this.y,scl,scl);

  if (this.revealed){
    if (this.mine) {
      ellipseMode(CORNER);
      fill(150);
      ellipse(this.x+scl*0.25, this.y+scl*0.25, scl/2 );
    } else {
      fill(210);
      rect(this.x, this.y,scl,scl);
      if (this.number != 0){
        fill(0);
        textSize(23);
        text(this.number, this.x+scl*0.25, this.y+scl*0.75);

      }
    }
  }
}

Cell.prototype.contains = function(x, y) {
  return (this.x < x && x < this.x + scl && this.y < y && y < this.y + scl);
}

Cell.prototype.reveal = function() {
  this.revealed = true;
  if (this.number == 0) {
    for(var i = -1; i <= 1; i++) {
      for(var j = -1; j <= 1; j++) {
        if (-1 < this.i + i && this.i + i < grid.length && -1 < this.j + j && this.j + j < grid[0].length){
          if(!grid[this.i + i][this.j + j].revealed){
            grid[this.i + i][this.j + j].reveal();
          }
        }
      }
    }
  }
}
Cell.prototype.nearbyMines = function() {
  var total = 0;

  if (this.mine) {
    this.number = -1;
  }

  for(var i = -1; i <= 1; i++) {
    for(var j = -1; j <= 1; j++) {
      if (-1 < this.i + i && this.i + i < grid.length && -1 < this.j + j && this.j + j < grid[0].length){
        var neighbor = grid[this.i + i][this.j + j];
        if(neighbor.mine) {
          total++;
        }

      }
    }
  }
  this.number = total;
}

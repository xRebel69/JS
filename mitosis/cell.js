function Cell(pos, r, col) {
  this.pos = pos;
  this.r = r;
  this.col = col
  this.update = function() {
    this.pos.add(p5.Vector.random2D());
  }

  this.mitosis = function() {
    var randomVec = p5.Vector.random2D();
    this.pos.add(randomVec.mult(20));

    return (new Cell(createVector(this.pos.x, this.pos.y), r/2, this.col));
  }

  this.show = function() {
    fill(col);
    noStroke();
    ellipse(pos.x, pos.y, this.r*2, this.r*2);
  }

  this.contains = function(x, y) {
    var d = dist(pos.x, pos.y, x, y);

    if (d < this.r) {
      console.log("clicked");
      return true;
    } else {
      return false;
    }
  }
}

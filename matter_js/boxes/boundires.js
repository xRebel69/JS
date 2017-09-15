function Boundary(x, y, w, h, a) {
  this.option = {
    angle: a,
    isStatic: true
  }
  this.body = Bodies.rectangle(x, y, w, h, this.option);
  this.width = w;
  this.height = h;
  World.add(engine.world, this.body);

  this.display = function() {
    //
    var pos = this.body.position;
    var angle = this.body.angle;
    //
    push();
    //
    translate(pos.x, pos.y);
    rotate(angle);
    rectMode(CENTER);
    noStroke();
    fill(0);
    rect(0, 0, this.width, this.height);
    //
    pop();

  }
}

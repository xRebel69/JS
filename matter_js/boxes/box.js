function Box(x, y, w, h) {
  this.option = {
    friction: 0,
    restitution: 0
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
    fill(255);
    rect(0, 0, this.width, this.height);
    //
    pop();

  }
}

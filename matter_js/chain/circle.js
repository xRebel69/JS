function Circle(x, y, r, stat) {
  this.option = {
    friction: 0,
    restitution: 0,
    isStatic: stat
  }
  this.body = Bodies.circle(x, y, r,this.option);
  this.radius = r;
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
    ellipse(0, 0, r*2, r*2);
    //
    pop();

  }
}

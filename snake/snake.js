var scl = 30;

function Snake() {
  this.x = 300;
  this.y = 300;
  this.xspeed = 0;
  this.yspeed = 0;
  this.tail = [];

  this.death = function() {
    for(var i = 0; i < this.tail.length; i++) {
        if (this.x == this.tail[i].x && this.y == this.tail[i].y) {
            return true;
          } else {
            return false;
          }
      }
    }


  this.eat = function(food) {
    if (food.x === this.x && food.y === this.y) {
      this.tail.push(createVector(food.x, food.y))
      return true;
    } else {
      return false;
    }
  }

  this.direction = function(xvalue, yvalue) {
    this.xspeed = xvalue;
    this.yspeed = yvalue;
  }

  this.update = function () {

    for(var i = 0; i < this.tail.length-1; i++) {
      this.tail[i] = this.tail[i+1];
    }
    this.tail[this.tail.length-1] = createVector(this.x, this.y);

    this.x += this.xspeed*scl;
    this.y += this.yspeed*scl;

    this.x = constrain(this.x , 0, width-scl);
    this.y = constrain(this.y , 0, height-scl);
  }

  this.show = function() {
    fill(255);
    rect(this.x, this.y, scl, scl);

    for (var i = 0; i < this.tail.length; i++) {
      rect(this.tail[i].x, this.tail[i].y, scl, scl);

    }
  }
}

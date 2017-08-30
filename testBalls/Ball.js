function Ball (x, y) {
  this.x = x;
  this.y = y;
  this.size = random(10,50);
  this.col = color(255)

  this.display = function() {
    fill(this.col);
    stroke(255);
    ellipse(this.x, this.y, this.size, this.size);
  }

  this.update = function() {
    //var m = map(mouseX, 0, width, 0, 10);
    this.x = this.x + random(-slider.value(),slider.value());
    this.y = this.y + random(-slider.value(),slider.value());
  }

  this.intersect = function(other) {
    var d = dist(this.x, this.y, other.x, other.y);
    if (d < (this.size/2) + (other.size/2)) {
      this.col = color(random(255), random(255), random(255));
    }
  }


  this.outside = function() {
    if(this.x < 0 || this.x > width || this.y < 0 || this.y > height) {
      return true;
    } else {
      return false;
    }

  }
}

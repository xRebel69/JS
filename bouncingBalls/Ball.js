function Ball(x, y) {
  this.x = x;
  this.y = y;
  this.size = 40;
  this.speed = 5;
  this.distance = height-y;
  this.up = false;
  this.c1 = 0;
  this.c2 = 0;

  this.display = function () {
    ellipseMode(CENTER);
    fill(255);
    noStroke();
    ellipse(this.x, this.y, this.size, this.size);
  }
  this.update = function () {
    if (this.y < height-(this.size/2) && !this.up){
        this.y = this.y + this.speed;
        //print(this.distance);
        //this.distance = floor(this.distance / 2);
        

    } else {
      this.up = true;
      //this.distance = floor(this.distance / 2);
    }

    if (this.y > height -this.distance && this.up){
        this.y = this.y - this.speed;
    } else {
      this.up = false;
      //print(this.distance);
    }
  }
}

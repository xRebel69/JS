var cells = [];

function setup() {
  createCanvas(500,500);
  for(var i = 0; i < 50; i++) {
    cells.push(new Cell(createVector(random(0, width), random(0, height)),50,
    color(random(100,255),0,random(100,255),100)));
  }

}

function draw() {
  background(51);
  for(var i = 0; i < cells.length; i++) {
    cells[i].update();
    cells[i].show();
  }
}

function mousePressed() {
  for(var i = cells.length - 1; i >= 0; i--) {
    if(cells[i].contains(mouseX, mouseY)) {
      var cellA = cells[i].mitosis();
      var cellB = cells[i].mitosis();

      cells.splice(i, 1);
      cells.push(cellA);
      cells.push(cellB);

    }

  }
}

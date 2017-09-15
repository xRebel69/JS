void setup() {
  size(600, 400);
}

void draw() {
  background(51);

  PVector A = new PVector(50, 300);
  PVector B = new PVector(450, 250);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector projec = scalarProjection2(A, B, mouse);
  strokeWeight(8);
  stroke(255);
  point(B.x, B.y);

  point(A.x, A.y);

  point(mouse.x, mouse.y);
  stroke(255, 0, 0);
  point(projec.x, projec.y);
  strokeWeight(1);

  stroke(255);
  line(A.x, A.y, B.x, B.y);
  line(A.x, A.y, mouse.x, mouse.y);
}

PVector scalarProjection(PVector a, PVector b, PVector m) {
  //PVector ab = PVector.sub(b, a);
  //PVector am = PVector.sub(m, a);

  //am.normalize();
  //am.mult(ab.dot(am));

  //PVector normal = PVector.add(a,am);
  //return normal;




  PVector staticLine = PVector.sub(b, a);
  PVector movingLine = PVector.sub(m, a);

  float theta = PVector.angleBetween(staticLine, movingLine);
  //float magStatic = staticLine.mag();
  staticLine.normalize();

  // float angel = cos(theta);
  PVector projection = PVector.mult(staticLine, movingLine.mag()*cos(theta));
  projection.add(a);
  return projection;
}


PVector scalarProjection2(PVector a, PVector b, PVector m) {

  PVector staticLine = PVector.sub(b, a);
  PVector movingLine = PVector.sub(m, a);

  staticLine.normalize();

  staticLine.mult(staticLine.dot(movingLine));
  
  //PVector projection = PVector.mult(staticLine, movingLine.mag()*cos(theta));
  staticLine.add(a);
  
  return staticLine;
}
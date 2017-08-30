function setup() {
  noCanvas();
  array1.push(array2[0]);
  array1.push(array2[0]);

  array1.push(array2[0]);

  print(array1);
  print(array2);

  array2.splice(0,1);
  print(array1);
  print(array2);

}
var array1 = [];
var array2 = [];
function draw() {

}

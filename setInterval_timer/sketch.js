var time;
var timer;
var inputTime;

function setup() {
  noCanvas();
  timer = select('#timer');
  inputTime = select('#inputTime');
  var submit = select('#submit');

  timer.style("font-size", "20pt");
  submit.mousePressed(startCounter);



}


var interval;
function startCounter() {
  time = inputTime.value();
  //timer.html(time);
  interval = setInterval(reduceTime, 1000 );
}

function reduceTime() {
  if (time === 0) {
    clearInterval(interval)
    timer.html("FINISHED");

  } else {
  time--;
  timer.html(convertToMins(time));
  }
}


function convertToMins(seconds) {
  var mins = floor(seconds/60);
  var seconds = seconds % 60;

  var hours = floor(mins/60);
  mins = mins % 60;


  return hours+":"+mins+":"+seconds;
}

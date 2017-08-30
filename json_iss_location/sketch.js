var data;
var text;
function setup() {
  createCanvas(400,400);
  setInterval(queryISS, 2000);


}

function dataReady(dat) {
  data = dat;
}

function queryISS() {
    loadJSON("http://api.open-notify.org/iss-now.json", dataReady);
}

function draw() {
  background(0);
  if(data) {
    fill(255);
    text("longitude: " + data.iss_position.longitude, 20, 20);
    text("latitude: " + data.iss_position.latitude, 20, 40);
    text("timestamp: " + data.timestamp, 20, 60);
  }

}

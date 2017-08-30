var apiurl = "http://api.giphy.com/v1/gifs/search?q=";
var apikey = "&api_key=35d05ec81d264de5af834abe47cd913a";
var randomGIFapi = "http://api.giphy.com/v1/gifs/random?api_key=35d05ec81d264de5af834abe47cd913a"

function setup() {
  noCanvas();

  var button = select("button");
  button.mousePressed(queryAPI);

  var random = select("#random");
  random.mousePressed(randomGIF);
}

function randomGIF() {
  loadJSON(randomGIFapi, getData1);
}

function getData1(img) {
  createImg(img.data.image_original_url);
}

function queryAPI() {
  var inputBox = select("#input");

  var limitBox = select("#size");
  loadJSON(apiurl + inputBox.value() + apikey + "&limit=" + limitBox.value(), getData);
}

function getData(imgs) {
  createP(imgs.data.length);
  for(var i = 0; i < imgs.data.length; i++) {
    //print((images.data[i].embed_url).replace('\"', ''));
    createImg(imgs.data[i].images.original.url);
  }
}

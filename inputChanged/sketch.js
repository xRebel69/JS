var textbox;
var texts;
function setup () {
  noCanvas();
  texts = createP("initialText");
  textbox = createInput("Enter text");

  textbox.input(addtext);
}

function addtext() {
  texts.position(random(600), random(600));
  texts.html(textbox.value());
}

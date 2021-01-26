var zoom = 1;
var img;
var cLat = 0;
var cLong = 0;
var cx;
var cy;
function preload() {
  let url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/0,0," + zoom + ",0,0/1024x512?access_token=pk.eyJ1IjoiZmFiaW85NiIsImEiOiJja2tjdWdkaXUwbDJmMndwYXZtanU4cTJpIn0.MC4Qw0Ut35NBWc4CsnWk4A";
  img = loadImage(url);
}
function setup() {
  setInterval(chiediCoordinate, 1000);
  createCanvas(1024, 512);
  cx = coordX(cLong);
  cy = coordY(cLat);
  translate(width / 2, height / 2);
  imageMode(CENTER);
  image(img, 0, 0);
}

function chiediCoordinate() {
  loadJSON("http://api.open-notify.org/iss-now.json", datiRicevuti, 'jsonp');
}

function datiRicevuti(dati) {
  var navicella = dati;
  var long = navicella.iss_position.longitude;
  var lat = navicella.iss_position.latitude;
  var x = coordX(long) - cx;
  var y = coordY(lat) - cy;
  fill(255, 0, 0, 255);
  ellipse(x, y, 5, 5);
}

function coordX(longitudine) {
  longitudine = radians(longitudine);
  var a = (256 / PI) * pow(2, zoom);
  var b = longitudine + PI;
  return a * b;
}

function coordY(latitudine) {
  latitudine = radians(latitudine);
  var a = (256 / PI) * pow(2, zoom);
  var b = tan(PI / 4 + latitudine / 2);
  var c = PI - log(b);
  return a * c;
}


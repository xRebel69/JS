var YQL = require('yql');

var query = new YQL('select * from weather.forecast where woeid in (select woeid from geo.places(1) where text="jeddah")');

query.exec(function(err, data) {
  var location = data.query.results.channel.location;
  var condition = data.query.results.channel.item.condition;
  var atmosphere = data.query.results.channel.atmosphere;
  var astronomy = data.query.results.channel.astronomy;
  var celsius = Math.round((condition.temp - 32) * (5/9));

  console.log('The current weather in ' + location.city + ', ' + location.region + ' is ' + condition.temp + ' degrees.'+celsius);
  console.log('The humidity is ' + atmosphere.humidity + '%');
  console.log('Sunrises at '+ astronomy.sunrise + " and sets at "+ astronomy.sunset);
});

var Twit = require('twit');
var twitterAcc = require('./config')
var T = new Twit(twitterAcc);

//favoriteFromUser('HqMuhannad', 50);
// setInterval(tweetWeather, 1000*60*30);
// setInterval(displayUpTime, 1000*60*10);

//retweetFromUser('Jjsjhs3',3);
tweetWeather();

var time = 0;
function displayUpTime() {
  time++;
  console.log(time*10 + ' min');
}

// To tweet pass the message in the arguments
function tweet(message) {
  T.post('statuses/update', { status: message }, function(err, data, response) {
    if (err) {
      console.log("something went wrong "+err);
    } else {
      console.log("\"" + message + "\"" + " was tweeted");
    }
})
}

// To like tweets from a 'username' and how many tweets to check
function favoriteFromUser(username, noOfTweets) {
  T.get('statuses/user_timeline', { screen_name: username, count: noOfTweets}, function(err, data, response) {
    var counter = 0;

    for(var i =0; i <data.length; i++) {
      if(typeof data[i].retweeted_status === "undefined") {

        T.post('favorites/create', { id: data[i].id_str }, function (err, data, response) {
          if (err) {
            console.log("something went wrong");
          } else {
            counter++;
            console.log(counter + " tweets were favorited");
          }
        })
      }
    }
  })
}

// To retweet tweets from a 'username' and how many tweets to check
function retweetFromUser(username, noOfTweets) {
  T.get('statuses/user_timeline', { screen_name: username, count: noOfTweets}, function(err, data, response) {
    var counter = 0;

    for(var i =0; i <data.length; i++) {
      if(typeof data[i].retweeted_status === "undefined") {

        T.post('statuses/retweet/:id', { id: data[i].id_str }, function (err, data, response) {
          if (err) {
            console.log("something went wrong " + err);
          } else {
            counter++;
            console.log(counter + " tweets were retweeted");
          }
        })
      }
    }
  })
}

function tweetWeather() {
  var YQL = require('yql');

  var query = new YQL('select * from weather.forecast where woeid in (select woeid from geo.places(1) where text="jeddah")');

  query.exec(function(err, data) {
    var location = data.query.results.channel.location;
    var condition = data.query.results.channel.item.condition;
    var atmosphere = data.query.results.channel.atmosphere;
    var astronomy = data.query.results.channel.astronomy;
    var celsius = Math.round((condition.temp - 32) * (5/9));

    //console.log(data);
    tweet(time+' The current weather in ' + location.city + ', ' + location.region + ' is ' + celsius + ' degrees celsius. '
          + 'Sunrises at '+ astronomy.sunrise + " and sets at "+ astronomy.sunset);
    // console.log('The current weather in ' + location.city + ', ' + location.region + ' is ' + celsius + ' degrees celsius.');
    // console.log('The humidity is ' + atmosphere.humidity + '%');
    // console.log('Sunrises at '+ astronomy.sunrise + " and sets at "+ astronomy.sunset);
  });

}

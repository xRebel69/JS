var request = require("request");

var url = 'http://api.aladhan.com/timingsByCity?city=jedda&country=SA&method=4';

var theTweet = '';
request({
  url: url,
  json: true,
}, function (error, response, body) {
  if (!error && response.statusCode === 200) {
    var times = body.data.timings
    theTweet += (body.data.date.readable);
    theTweet +=("\nFajr "+ times.Fajr);
    theTweet +=("\nDhuhr "+ times.Dhuhr);
    theTweet +=("\nAsr "+ times.Asr);
    theTweet +=("\nMaghrib "+ times.Maghrib);
    theTweet +=("\nIsha "+ times.Isha);

    console.log(theTweet);
  }
});

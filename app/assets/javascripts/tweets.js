function trendFeed() {
  $('.tweets').hide();
  $.ajax({
    url: '/items/new.json',
    method: 'get',
    dataType: 'json',
    success: displayFeed,
    error: function(data) { console.log(data); }
  });
}

const getRandomIdx = (max) => {
  return Math.floor(Math.random() * max);
};

function displayFeed(data) {
  const numTweets = 5;
  const tweetIndexes = [];

  // Get 5 random tweets from array
  while (tweetIndexes.length < numTweets) {
    const randomIdx = getRandomIdx(data.length);
    if (tweetIndexes.indexOf(randomIdx) == -1) {
      tweetIndexes.push(randomIdx);
    }
  }

  tweetIndexes.forEach((index) => {
    const tweet = data[index];
    const tweetEl = $('<p>').append(tweet);
    $('.tweets').append(tweetEl);
  });

  $('.tweets').toggle('slide');
}

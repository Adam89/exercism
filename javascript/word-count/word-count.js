var Phrase = function (words) {
  var result = {};
  var all_words = words.toLowerCase().replace(/\s/, "").split(" ");

  for(var i = 0; i < all_words.length; i++) {
    if (result.hasOwnProperty(all_words[i])) {
      result[all_words[i]] += 1;
    } else {
      result[all_words[i]] = 1;
    }
  }
  return result;
};

module.exports = Phrase;

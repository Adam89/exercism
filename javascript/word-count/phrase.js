Phrase = function () {
  this.word_count = function(word) {
    // var i = 0;
    // return {word: i+=1};
    var words = word.split(" ");
    var result = {};
    for(var i = 0;  i < words.length; i++ ) {
      if (result[words[i]] === undefined){
        result[words[i]] = 1;
      } else {
        result[words[i]] += 1;
      }
    };
    return result;
  };
};

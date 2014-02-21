Bob = function () {
  this.hey = function(sentence) {
    if (!/\S/.test(sentence)) {
      return "Fine. Be that way!";
    }
    else if (/^[^a-z(?)]*$/i.test(sentence)) {
      return "Whatever.";
    }
    else if (sentence[sentence.length - 1] === "?" && sentence.match(/\d+/g)) {
      return "Sure.";
    }
    else if((sentence[sentence.length - 1] === "?") && (sentence.toUpperCase() === sentence)) {
      return "Woah, chill out!";
    }
    else if (sentence[sentence.length - 1] === "?") {
      return "Sure.";
    }
    else if (sentence.toUpperCase() === sentence ) {
      return "Woah, chill out!";
    }
    else{
      return "Whatever.";
    }
  };
};

module.exports = Bob

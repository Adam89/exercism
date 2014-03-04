var Bob = function () {
  this.hey = function(sentence) {


    if (isSilent(sentence)) {
      return "Fine. Be that way!";
    }
    else if (isConfusing(sentence)){
      return "Whatever.";
    }
    else if (isQuestion(sentence)) {
      return "Sure.";
    }
    else if(isShouting(sentence)) {
      return "Woah, chill out!";
    }
    else if (isQuestionTwo(sentence)) {
      return "Sure.";
    }
    else if (isShoutingTwo(sentence)) {
      return "Woah, chill out!";
    }
    else {
      return "Whatever.";
    }
  };

    var isShouting = function(sentence) {
      var shouting = (sentence[sentence.length - 1] === "?") && (sentence.toUpperCase() === sentence);  
      return shouting;
    };

    var isShoutingTwo = function(sentence) {
      var shouting = sentence.toUpperCase() === sentence;
      return shouting; 
    };

    var isSilent = function(sentence) {
      var silent = !/\S/.test(sentence);
      return silent; 
    };

    var isQuestionTwo = function(sentence) {
      var question = (sentence[sentence.length - 1] === "?");  
      return question;
    };

    var isQuestion = function(sentence) {
      var question = (sentence[sentence.length - 1] === "?" && sentence.match(/\d+/g));
      return question;
    };

    var isConfusing = function(sentence) {
      return (/^[^a-z(?)]*$/i.test(sentence));
    };
};

module.exports = Bob

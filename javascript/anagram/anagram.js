var Anagram = function(word) {
  this.match = function(potential_anagrams){
    var anagrams = [];

    var addAnagram = function(element, index, array) {
      if(isAnagram(word, element)) {
        anagrams.push(element);
      }
    }

    potential_anagrams.forEach(addAnagram);

    return anagrams;
  }

  var isAnagram = function(word, other_word) {
    return (sortAlphabetically(word) == sortAlphabetically(other_word)) && (!isOwnAnagram(word, other_word))
  }

  var isOwnAnagram = function(word, other_word) {
    return word.toLowerCase() == other_word.toLowerCase()
  }

  var sortAlphabetically = function(word){
    return word.toLowerCase().split('').sort().join();
  }
};

module.exports = Anagram;

require('./phrase')
describe("PhraseTest", function() {

  var phrase = new Phrase();

  it("should count one word", function() {
      var response = phrase.word_count("word");
      expect(response).toEqual({"word": 1});
  });

  it("should count one of each one word", function() {
      var response = phrase.word_count("word lol noo");
      expect(response).toEqual({"word": 1, "lol": 1, "noo": 1});
  });

});

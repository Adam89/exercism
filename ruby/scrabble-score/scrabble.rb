class Scrabble

  attr_reader :score, :word

  def initialize(word)
    @score = 0
    @word = word
    @letters = {a: 1, e: 1, m: 1, b: 3, c: 3}
  end

  def calculate
    #takes the word input
    #splits it up into individual characters and downcase each one
    #compares the characters to letters in our hash
    #if they match return the value and add it to our score
    @word = @word.split("").map(&:downcase)
  end

end

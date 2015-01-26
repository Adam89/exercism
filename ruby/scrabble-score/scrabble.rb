class Scrabble
  LETTERS =  {
    "a" =>1, "e" => 1, "m" => 1, "i" => 1,
    "o" => 1, "u" => 1, "l" => 1, "n" => 1,
    "r" => 1, "s" => 1, "t" => 1, "d" => 2,
    "g" => 2, "b" => 3, "c" => 3, "m" => 3,
    "p" => 3, "f" => 4, "h" => 4, "v" => 4,
    "w" => 4, "y" => 4, "k" => 5, "j" => 8,
    "x" => 8, "q" => 10, "z" => 10
  }

  def self.score(word)
    new(word).score
  end

  attr_reader :score

  def initialize(word)
    @score = 0
    @word = word
    calculate
  end

  def calculate
    if no_words?
      return
    end

    chosen_letters = word.split("").map(&:downcase)

    chosen_letters.each do |letter|
      if LETTERS.keys.include? letter
        @score += LETTERS[letter]
      end
    end
  end

  private

  attr_reader :word, :letters

  def no_words?
    word.nil?
  end
end

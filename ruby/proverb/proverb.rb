class Proverb

  attr_reader :nouns
  def initialize(*nouns)
    @nouns = nouns
  end

  def to_s
    @nouns.map.with_index do |noun, index|
      first_part_of_chorus(noun) + second_part_of_chorus(@nouns[index+1])
    end.join + " And all for the want of a #{@nouns.first}."
  end

  def first_part_of_chorus(word)
    "For want of a #{word}"
  end

  def second_part_of_chorus(word)
    " the #{word} was lost.\n"
  end
end

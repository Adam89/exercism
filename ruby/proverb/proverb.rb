class Proverb

  attr_reader :nouns
  def initialize(*nouns)
    @nouns = nouns
  end

  def to_s
    "For want of a #{@nouns.first} the #{@nouns.last} was lost.\n" +
      "And all for the want of a #{@nouns.first}."
  end

end

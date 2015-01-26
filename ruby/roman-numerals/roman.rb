require 'pry'
class Fixnum
  MAPPINGS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
  }

  def to_roman
    if MAPPINGS.keys.include? self
      MAPPINGS[self]
    else
      meh
    end
  end

  def meh
    numeral = ""

    if self < 4
      self.times do
        numeral << MAPPINGS[1]
      end
    end

    if self == 4
      numeral << MAPPINGS[1]
      numeral << MAPPINGS[5]
    end

    numeral
  end
end

class TriangleError < StandardError; end

class Triangle
  attr_reader :sides

  def initialize(hyp, opp, adj)
    @sides = [hyp, opp, adj]
    illegal
  end

  def kind
    {1 => :equilateral, 2 => :isosceles, 3 => :scalene}[sides.uniq.length]
  end

  private

  def illegal
    if any_side_not_valid_length? || sides_inequality?
      raise TriangleError
    end
  end

  def sides_inequality?
    a, b, c = sides.sort
    c >= (a + b)
  end

  def any_side_not_valid_length?
    sides.any? {|side| side <= 0}
  end
end

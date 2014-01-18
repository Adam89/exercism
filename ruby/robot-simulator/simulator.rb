class Robot
  attr_reader :bearing, :coordinates

  def directions
    [:north, :northeast, :east, :southeast, :south, :southwest, :west, :northwest]
  end

  def orient(direction)
    raise ArgumentError unless directions.include?(direction)
    @bearing = direction
  end

  def turn_right
    @bearing = directions[directions.index(bearing) - 6]
  end

  def turn_left
    @bearing = directions[directions.index(bearing) - 2]
  end

  def at(x,y)
    @coordinates = [x, y]
  end

  def advance

  end
end

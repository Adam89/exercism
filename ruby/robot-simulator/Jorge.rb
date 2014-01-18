class Robot
  attr_reader :bearing, :coordinates

  def valid_directions
    [:north, :east, :south, :west]
     #0      -3      -2      -1
     #0       1       2       3
  end

  def orient(direction)
    raise ArgumentError unless valid_directions.include?(direction)
    @bearing = direction
  end

  def turn_right
    @bearing = valid_directions[valid_directions.index(bearing) - 3]
    #-3,-2,-1,0
  end

  def turn_left
    @bearing = valid_directions[valid_directions.index(bearing) - 1 ]
  end

  def at(x,y)
    @coordinates = [x, y]
  end

  def advance
    @coordinates = advance_coordinates(bearing)
  end

  def advance_coordinates(bearing)
    coordinates_movements[bearing]
  end

  def coordinates_movements
    {
      north: [coordinates[0], coordinates[1] + 1],
      east:  [coordinates[0] + 1, coordinates[1]],
      south: [coordinates[0], coordinates[1] - 1],
      west:  [coordinates[0] - 1, coordinates[1]]
    }
  end
end

class Simulator
  def instructions(actions)
    actions = actions.split('')
    actions.collect do |action|
      {
        "L" => :turn_left,
        "R" => :turn_right,
        "A" => :advance,
      }[action]
    end
  end

end

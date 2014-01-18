class Goalie
  attr_reader :dive
  def guess(side)
    raise ArgumentError unless side == "L" || side == "R"
    @dive = side
  end
end

class Player
  attr_reader :aim
  def kick(side)
    raise ArgumentError unless side == "L" || side == "R"
    @aim = side
  end
end

class Match
  attr_reader :player, :goalie

  def initialize(goalie, player)
    @player = player
    @goalie = goalie
  end

  def score
    if goalie.dive != player.aim
      "Goal!!!"
    else
      "Blocked"
    end
  end
end

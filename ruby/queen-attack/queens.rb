require 'pry'
class Queens
  # attr_reader :position
  # def initialize(position = {})
  #   if position.empty?
  #       @position = position
  #   elsif position[:black] == position[:white]
  #     raise ArgumentError
  #   else
  #     @position = position
  #   end
  # end

  # def white
  #   if position == {}
  #     [0,3]
  #   else
  #     position[:white]
  #   end
  # end

  # def black
  #   if position == {}
  #     [7,3]
  #   else
  #     position[:black]
  #   end
  # end
@places = {
  "a1"=>" ","a2"=>" ","a3"=>" ","a4"=>" "
  "b1"=>" ","b2"=>" ","b3"=>" ","b4"=>" "
  "c1"=>" ","c2"=>" ","c3"=>" ","c4"=>" "
}
  @columns = [
  ['a1','a2','a3','a4','a5','a6','a6','a7'],
  ['b1','b2','b3','b4','b4','b5','b6','b7'],
  ['c1','c2','c3','c4','c4','c5','c6','c7'],
  ['a1','b1','c1','b4','b4','b5','b6','b7'],
  ['a2','b2','c2','b4','b4','b5','b6','b7'],
  ['a3','b3','c3','b4','b4','b5','b6','b7'],
  ['a1','b2','c3','b4','b4','b5','b6','b7'],
  ['c1','b2','a3','b4','b4','b5','b6','b7']
]
end

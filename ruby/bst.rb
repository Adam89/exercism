class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    @left = Bst.new(new_data)
    @right = Bst.new(new_data)
  end
end

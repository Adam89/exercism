class Element

  attr_reader :datum, :next

  @store = []

  def initialize(datum, nearest)
    @datum = datum
    @next = nearest
  end

  def reverse
    #Take the instances of Element
    #Now take the index position of the element
      #and give it a new index position
      #of (+n-1)
    #After this process is complete set each elements 
    #next value to nil.
  end

  def self.to_a(obj)
    if obj
      @store << obj.datum
      @store.reverse
    else
      []
    end 
  end

end

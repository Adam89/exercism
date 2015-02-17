require 'pry-byebug'

class Deque
  def initialize
    @element = Element.new
  end

  def push(data)
    local_element = element
    while local_element.next
      local_element = local_element.next
    end

    local_element.next = Element.new(data)
  end

  def pop
    local_element = element

    while local_element.next
      next_element = local_element
      local_element = local_element.next
    end

    next_element.next = nil
    local_element.data
  end

  def shift
    if element.next
      next_element = element.next
      next_next_element = next_element.next
    end

    element.next = next_next_element
    next_element.data
  end

  def unshift(data)
    if element.next
      last = element.next
      element.next = Element.new(data)
      element.next.next = last
    else
      element.next = Element.new(data)
    end
  end

  private

  attr_reader :element
end

class Element
  def initialize(data=nil)
    @data = data
  end

  def next=(element)
    if element
      @next = element
    else
      @next = element
    end
  end

  attr_reader :next
  attr_reader :data
end

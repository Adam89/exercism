class Element
  attr_accessor :datum, :next

  def initialize(datum, node)
    @datum = datum
    @next = node
  end

  def reverse
    build_new_elements(collect_all_nodes)
  end

  def to_a
    result = []
    element = self

    if element && element.next
      result << element.datum
      result + element.next.to_a
    elsif element
      result << element.datum
    else
      result
    end
  end

  def self.to_a(element)
    element.to_a
  end

  def self.from_a(list)
    list = list.to_a
    return if list.empty?

    self.new(1, nil).send(
      :build_new_elements,
      list.reverse
    )
  end

  private

  def collect_all_nodes
    result = []
    element = self
    while element
      result << element
      element = element.next
    end
    result
  end

  def build_new_elements(elements)
    old_element = nil

    elements.map do |datum|
      current_element = Element.new(
        if datum.class == Element
          datum.datum
        else
          datum
        end,
        old_element
      )
      old_element = current_element
    end.last
  end
end

class MergeSort
  def initialize(list)
    @list = list
  end

  def merge_sort
    if @list.length < 2
      return @list
    else
      right = MergeSort.new(@list[0..@list.length/2 - 1]).sort
      left  = MergeSort.new(@list[@list.length/2..-1]).sort
    end

    merge(left, right)
  end

  def sort
    if @list.length < 2
      return @list
    else
      right = MergeSort.new(@list[0..@list.length/2 - 1]).sort
      left  = MergeSort.new(@list[@list.length/2..-1]).sort
    end

    merge(left, right)
  end

  private

  def merge(left, right)
    result = []
    i = 0
    while right.length > i || left.length > i
      if right[i] == nil
        result = result + left[i..-1]
        break
      elsif left[i] == nil
        result = result + right[i..-1]
        break
      elsif right[i] < left[i]
        result << right.shift
      elsif left[i] < right[i]
        result << left.shift
      end
    end

    result
  end
end

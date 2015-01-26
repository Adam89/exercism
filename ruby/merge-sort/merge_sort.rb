require 'pry-byebug'
class MergeSort
  def initialize(list)
    @list = list
  end

  def merge_sort
    result = []
    i = 0
    j = 0

    if @list.length < 2
      return @list
    else
      right = MergeSort.new(@list[0..@list.length/2 - 1]).sort
      left  = MergeSort.new(@list[@list.length/2..-1]).sort
    end

    while right.length > i || left.length > j
      if right[i] == nil
        result = result + left[j..-1]
        break
      elsif left[j] == nil
        result = result + right[i..-1]
        break
      elsif right[i] < left[j]
        result << right.shift
      elsif left[i] < right[i]
        result << left.shift
      end
    end

    result
  end

  def sort
    result = []
    i = 0
    j = 0

    if @list.length < 2
      return @list
    else
      right = MergeSort.new(@list[0..@list.length/2 - 1]).sort
      left  = MergeSort.new(@list[@list.length/2..-1]).sort
    end

    while right.length > i || left.length > j
      if right[i] == nil
        result = result + left[j..-1]
        break
      elsif left[j] == nil
        result = result + right[i..-1]
        break
      elsif right[i] < left[j]
        result << right.shift
      elsif left[i] < right[i]
        result << left.shift
      end
    end

    result
  end
end

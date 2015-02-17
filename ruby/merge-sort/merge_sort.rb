class MergeSort
  def initialize(list)
    @list = list
  end

  def merge_sort
    if @list.length < 2
      return @list
    else
      right = MergeSort.new(@list[0..@list.length/2 - 1]).merge_sort
      left  = MergeSort.new(@list[@list.length/2..-1]).merge_sort
    end

    merge(left, right)
  end

  private

  def merge(left, right)
    result = []
    zero = 0

    while right.length > zero || left.length > zero
      if right[zero] == nil
        result = result + left[zero..-1]
        break
      elsif left[zero] == nil
        result = result + right[zero..-1]
        break
      elsif left[zero] == result[-1]
        left.shift
      elsif right[zero] == result[-1]
        right.shift
      elsif right[zero] <= left[zero]
        result << right.shift
      elsif left[zero] <= right[zero]
        result << left.shift
      end
    end

    result
  end
end

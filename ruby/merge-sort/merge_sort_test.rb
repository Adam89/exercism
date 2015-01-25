require 'minitest/autorun'
require 'minitest/pride'
require_relative 'merge_sort'

class MergeSortTest < MiniTest::Test
  def test_it_sorts_for_base_case
    merge = MergeSort.new([])

    assert_equal [], merge.merge_sort
  end

  def test_it_sorts_for_second_base_case
    merge = MergeSort.new([1])

    assert_equal [1], merge.merge_sort
  end

  def test_it_sorts_for_small_even_length_unordered_list
    merge = MergeSort.new([2, 1])

    assert_equal [1, 2], merge.merge_sort
  end

  def test_it_sorts_for_bigger_even_length_unordered_list
    merge = MergeSort.new([1, 2, 4, 3])

    assert_equal [1, 2, 3, 4], merge.merge_sort
  end

  def test_it_sorts_for_small_odd_length_unordered_list
    merge = MergeSort.new([3, 2, 1, 5, 4])

    assert_equal [1, 2, 3, 4, 5], merge.merge_sort
  end
end

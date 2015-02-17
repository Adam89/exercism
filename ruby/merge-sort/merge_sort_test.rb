require 'minitest/autorun'
require 'minitest/pride'
require_relative 'merge_sort'

class MergeSortTest < MiniTest::Test
  def test_it_sorts_for_empty_array
    merge = MergeSort.new([])

    assert_equal [], merge.merge_sort
  end

  def test_it_sorts_for_array_with_one_element
    merge = MergeSort.new([1])

    assert_equal [1], merge.merge_sort
  end

  def test_it_sorts_for_small_even_length_unordered_array
    merge = MergeSort.new([2, 1])

    assert_equal [1, 2], merge.merge_sort
  end

  def test_it_sorts_for_bigger_even_length_unordered_array
    merge = MergeSort.new([1, 2, 4, 3])

    assert_equal [1, 2, 3, 4], merge.merge_sort
  end

  def test_it_sorts_for_small_odd_length_unordered_array
    merge = MergeSort.new([3, 2, 1, 5, 4])

    assert_equal [1, 2, 3, 4, 5], merge.merge_sort
  end

  def test_it_sorts_for_large_odd_length_unordered_array
    merge = MergeSort.new([3, 2, 1, 5, 4, 6, 8])

    assert_equal [1, 2, 3, 4, 5, 6, 8], merge.merge_sort
  end

  def test_it_sorts_for_larger_odd_length_unordered_array
    merge = MergeSort.new([3, 2, 1, 5, 4, 6, 8, 11, 9, 10, 100, 43, 50])

    assert_equal [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 43, 50, 100], merge.merge_sort
  end

  def test_it_sorts_for_small_odd_length_unordered_array_with_duplicates
    merge = MergeSort.new([3, 2, 1, 1, 2])

    assert_equal [1, 2, 3], merge.merge_sort
  end

  def test_it_sorts_for_large_odd_length_unordered_array_with_duplicates
    merge = MergeSort.new([3, 2, 1, 1, 5, 3, 4, 6, 8, 11, 9, 10, 100, 43, 50])

    assert_equal [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 43, 50, 100], merge.merge_sort
  end

  def test_it_sorts_for_very_large_array
    large_unsorted_array = (1..1_000_000).to_a.shuffle!
    merge = MergeSort.new(large_unsorted_array)

    expected = (1..1_000_000).to_a
    assert_equal expected, merge.merge_sort
  end
end

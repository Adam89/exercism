require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary'

class BinarySearchTest < MiniTest::Unit::TestCase
  def test_it_has_list_data
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal [1, 3, 4, 6, 8, 9, 11], binary.list
  end

  def test_it_raises_error_for_unsorted_list
    assert_raises ArgumentError do
      BinarySearch.new([2, 1, 4, 3, 6])
    end
  end

  def test_it_raises_error_for_data_not_in_list
    assert_raises RuntimeError do
      BinarySearch.new([1, 3, 6]).search_for(2)
    end
  end

  def test_it_finds_position_of_middle_item
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal 3, binary.middle
  end

  def test_it_finds_position_of_search_data
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11])
    assert_equal 5, binary.search_for(9)
    assert_equal 6, binary.search_for(11)
  end

  def test_it_finds_position_in_a_larger_list
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144])
    assert_equal 1, binary.search_for(3)
    assert_equal 7, binary.search_for(55)
    assert_equal 8, binary.search_for(89)
  end

  def test_it_finds_correct_position_in_a_list_with_an_even_number_of_elements
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
    assert_equal 2, binary.search_for(5)
    assert_equal 5, binary.search_for(21)
    assert_equal 6, binary.search_for(34)
  end

  def test_it_finds_correct_position_in_a_huge_list_with_an_even_number_of_elements
    huge_list = (1..10000).to_a
    binary = BinarySearch.new(huge_list)

    assert_equal 5000, binary.search_for(5001)
    assert_equal 249, binary.search_for(250)
    assert_equal 4000, binary.search_for(4001)
  end
end

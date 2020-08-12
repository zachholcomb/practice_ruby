require 'minitest/autorun'
require 'minitest/pride'
require './lib/payload'

class PayloadTest < Minitest::Test
  def setup
    @payload = Payload.new
  end

  def test_it_can_find_numbers
    assert_equal @payload.find_matching_pair([4, 2, 6, 7], 8), [6, 2]
  end

  def test_it_returns_an_empty_array_if_not_enough_numbers
    assert_equal @payload.find_matching_pair([4], 8), []
  end

  def test_it_returns_an_empty_array_if_nothing_matches
    assert_equal @payload.find_matching_pair([6, 7, 8, 9], 8), []
  end

  def test_it_works_for_negative_numbers
    payload = Payload.new
    assert_equal [15, -4], payload.find_matching_pair([1, 2, 3, -4, 15], 11)
  end
end
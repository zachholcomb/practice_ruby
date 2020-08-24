require_relative 'test_helper'
require './lib/levenshtein'

class LevenshteinTest < Minitest::Test
  def test_it_exists
    lev = Levenshtein.new('a', 'b')
    assert_instance_of Levenshtein, lev
  end

  def test_it_returns_0
    levenshtein = Levenshtein.new('a', 'a')
    assert_equal 0, levenshtein.distance
  end

  def test_it_works_with_substitution
    levenshtein = Levenshtein.new('da', 'ba')
    assert_equal 1, levenshtein.distance
  end

  def test_it_works_with_deletion
    levenshtein = Levenshtein.new('bad', 'ba')
    assert_equal 1, levenshtein.distance
  end

  def test_more_strings
    levenshtein = Levenshtein.new('dog', 'dude')
    assert_equal 3, levenshtein.distance
  end

  def test_more
    levenshtein = Levenshtein.new('cat', 'cute')
    assert_equal 2, levenshtein.distance
  end
end
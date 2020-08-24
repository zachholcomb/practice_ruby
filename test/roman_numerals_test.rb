require_relative 'test_helper'
require './lib/roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def setup 
    @roman_numerals = RomanNumerals.new
  end

  def test_it_exists
    assert_instance_of RomanNumerals, @roman_numerals
  end

  def test_it_converts_to_roman
    assert_equal @roman_numerals.to_roman(1), "I"
  end

  def test_converts_two
    assert_equal @roman_numerals.to_roman(2), "II"
  end

  def test_converts_three
    assert_equal @roman_numerals.to_roman(3), "III"
  end

  def test_converts_four
    assert_equal @roman_numerals.to_roman(4), "IV"
  end

  def test_converts_five
    assert_equal @roman_numerals.to_roman(5), "V"
  end

  def test_converts_six
    assert_equal @roman_numerals.to_roman(6), "VI"
  end

  def test_converts_seven
    assert_equal @roman_numerals.to_roman(7), "VII"
  end

  def test_converts_eight
    assert_equal @roman_numerals.to_roman(8), "VIII"
  end

  def test_converts_nine
    assert_equal @roman_numerals.to_roman(9), "IX"
  end

  def test_converts_ten
    assert_equal @roman_numerals.to_roman(10), "X"
  end

  def test_converts_eleven
    assert_equal @roman_numerals.to_roman(11), "XI"
  end

  def test_converts_twenty
    assert_equal @roman_numerals.to_roman(20), "XX"
  end

  def test_converts
    assert_equal @roman_numerals.to_roman(128), "CXXVIII"
  end

  def test_converts_over_thousand
    assert_equal @roman_numerals.to_roman(2000), "MM"
  end
end
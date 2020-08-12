require 'minitest/autorun'
require 'minitest/pride'
require './lib/grains'

class GrainsTest < Minitest::Test
  def test_square_1
    assert_equal 1, Grains.square(1)
  end

  def test_square_2
    assert_equal 2, Grains.square(2)
  end

  def test_square_3 
    assert_equal 4, Grains.square(3)
  end

   def test_square_4 
    assert_equal 8, Grains.square(4)
  end

  def test_square_5 
    assert_equal 16, Grains.square(5)
  end

  def test_square_6 
    assert_equal 32, Grains.square(6)
  end

  def test_square_7 
    assert_equal 64, Grains.square(7)
  end

  def test_square_8 
    assert_equal 128, Grains.square(8)
  end

  def test_square_9 
    assert_equal 256, Grains.square(9)
  end

  def test_square_10 
    assert_equal 512, Grains.square(10)
  end

  def test_16
    assert_equal 32_768, Grains.square(16)
  end

  def test_32
    assert_equal 2_147_483_648, Grains.square(32)
  end

  def test_64
    assert_equal 9_223_372_036_854_775_808, Grains.square(64)
  end

  def test_invalid_squares_return_not_on_board
    assert_equal "Invalid Square", Grains.square(-1)
    assert_equal "Invalid Square", Grains.square(65)
  end

  def test_it_can_calculate_total_grains
    assert_equal 18_446_744_073_709_551_615, Grains.total
  end
end 
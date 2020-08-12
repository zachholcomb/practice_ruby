require 'minitest/autorun'
require 'minitest/pride'
require './lib/matrix'

class MatrixTest < Minitest::Test
  def setup
    @matrix = Matrix.new("987\n532\n667")
  end

  def test_it_can_return_the_first_row
    assert_equal ['9', '8', '7'], @matrix.rows[0]
  end

  def test_it_can_return_the_second_row
    assert_equal ['5', '3', '2'], @matrix.rows[1]
  end

  def test_it_can_return_the_third_row
    assert_equal ['6', '6', '7'], @matrix.rows[2]
  end

  def test_it_can_return_the_first_column
    assert_equal ['9', '5', '6'], @matrix.columns[0]
  end

  def test_it_can_return_the_second_column
    assert_equal ['8', '3', '6'], @matrix.columns[1]
  end

  def test_it_can_return_the_third_column
    assert_equal ['7', '2', '7'], @matrix.columns[2]
  end
end
require_relative 'test_helper'
require './lib/twelve_days'

class TwelveDaysTest < Minitest::Test
  def setup
    file = File.read('./deps/song.txt')
    @lines = file.split("\n\n")
    @my_lines = TwelveDays.song.split("\n\n")
  end

  def test_first_line
    assert_equal @lines[0], @my_lines[0]
  end

  def test_second_line
    assert_equal @lines[1], @my_lines[1]
  end

  def test_third_line
    assert_equal @lines[2], @my_lines[2]
  end

  def test_fourth_line
    assert_equal @lines[3], @my_lines[3]
  end

  def test_fifth_line
    assert_equal @lines[4], @my_lines[4]
  end

  def test_sixth_line
    assert_equal @lines[5], @my_lines[5]
  end

  def test_seventh_line
    assert_equal @lines[6], @my_lines[6]
  end

  def test_eighth_line
    assert_equal @lines[7], @my_lines[7]
  end

  def test_ninth_line
    assert_equal @lines[8], @my_lines[8]
  end

  def test_tenth_line
    assert_equal @lines[9], @my_lines[9]
  end

  def test_eleventh_line
    assert_equal @lines[10], @my_lines[10]
  end

  def test_twelth_line
    assert_equal @lines[11], @my_lines[11]
  end

  def test_the_whole_song
    song_file = File.expand_path('../../deps/song.txt', __FILE__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end
end
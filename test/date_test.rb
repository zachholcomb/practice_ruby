require_relative 'test_helper'
require './lib/date_counter'

class DateTest < Minitest::Test
  def setup
    @dates = [
      "6/4/2020",
      "6/8/2020",
      "6/10/2020",
      "7/17/2020",
      "8/3/2020",
      "8/12/2020",
      "8/14/2020",
      "8/27/2020",
      "9/21/2020",
      "9/28/2020",
      "10/14/2020",
      "10/20/2020",
      "11/12/2020",
      "11/24/2020",
      "12/11/2020"
    ]
    @counter = DateCounter.new(@dates)
  end

  def test_it_exists
    assert_instance_of DateCounter, @counter
  end

  def test_it_can_count_months
    @counter.count_dates

    expected = {
      "6" => 3,
      "7" => 1,
      "8" => 4,
      "9" => 2,
      "10" => 2,
      "11" => 2,
      "12" => 1
    }
    assert_equal expected, @counter.months  
  end

  def test_it_can_count_all_days
    @counter.count_dates

    expected = {
      "4" => 1,
      "8" => 1,
      "10" => 1,
      "17" => 1,
      "3" => 1,
      "12" => 2,
      "14" => 2,
      "27" => 1,
      "21" => 1,
      "28" => 1,
      "20" => 1,
      "24" => 1,
      "11" => 1
    }
    
    assert_equal expected, @counter.days
  end

  def test_it_can_count_years
    @counter.count_dates

    expected = {
      "2020" => 15
    }

    assert_equal expected, @counter.years
  end

  def test_return_value_of_count_dates
    expected = {
      months: {
        "6" => 3,
        "7" => 1,
        "8" => 4,
        "9" => 2,
        "10" => 2,
        "11" => 2,
        "12" => 1
      },
      days: {
        "4" => 1,
        "8" => 1,
        "10" => 1,
        "17" => 1,
        "3" => 1,
        "12" => 2,
        "14" => 2,
        "27" => 1,
        "21" => 1,
        "28" => 1,
        "20" => 1,
        "24" => 1,
        "11" => 1
      },
      years: {
      "2020" => 15
      }
    }

    assert_equal expected, @counter.count_dates
  end
end
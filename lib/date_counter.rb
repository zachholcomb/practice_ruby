class DateCounter
  attr_reader :months, :days, :years

  def initialize(dates)
    @dates = dates
    @months = {}
    @days = {}
    @years = {}
    @key = {
      months: @months,
      days: @days,
      years: @years
    }
  end

  def count_dates
    @dates.each do |date|
      set_count(date, :months, 0)
      set_count(date, :days, 1)
      set_count(date, :years,2)
    end
    @key
  end

  def set_count(date, type, index)
    date = date_splitter(date, index)
    if @key[type][date].nil?
      @key[type][date] = 1
    else
      @key[type][date] += 1
    end
  end

  def date_splitter(date, index)
    date.split('/')[index]
  end
end
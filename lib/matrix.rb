class Matrix
  def initialize(list)
    @list = list
  end

  def rows
    @list.split("\n").map(&:chars)
  end

  def columns
    total = @list.split("\n").length
    (1..total).to_a.map do |num|
      split_columns(num)[num]
    end
  end

  private

  def split_columns(column_number)
    rows.reduce({}) do |acc, set|
      if !acc[column_number]
        acc[column_number] = [set[column_number - 1]]
        acc
      else
        acc[column_number] << set[column_number - 1]
        acc
      end
    end
  end
end
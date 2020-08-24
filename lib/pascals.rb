class Triangle

  def initialize(num)
    @level = num
  end

  def rows
    start_rows = [[1]]
    return start_rows if @level == 1

    (2..@level).reduce(start_rows) do |finish, row|
      new_row = [0, *finish.last, 0].each_cons(2).map(&:sum)
      finish.append(new_row)
    end
  end
end
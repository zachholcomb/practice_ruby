class Queens
  attr_reader :positions

  def initialize(positions)
    check_invalid_positions(positions)

    @positions = positions
  end

  def attack?
    return true if same_row?
    return true if same_column?
    return true if diagonal?
    
    false 
  end

  private

  def same_row?
    rows = positions.values.map { |p| p.first }
    rows.first == rows.last
  end

  def same_column?
    columns = positions.values.map { |p| p.last }
    columns.first == columns.last
  end

  def diagonal?
    line_x, line_y = positions[:white].zip(positions[:black]).map { |w, b| w - b }
    line_x.abs == line_y.abs
  end

  def check_invalid_positions(positions)
    invalid = positions.values.find do |position|
      !valid_position?(position)
    end

    if invalid
      raise ArgumentError, "#{invalid} is not a valid position!"
    end
  end

  def valid_position?(position)
    range = (0..7).to_a
    position.size == 2 && position.all? { |p| range.include?(p) }
  end
end
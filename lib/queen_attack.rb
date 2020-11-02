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
    return true if check_positive_x_positive_y?
    return true if check_negative_x_negative_y?
    return true if check_negative_x_positive_y?
    return true if check_positive_x_negative_y?
  
    false
  end

  def check_positive_x_positive_y?
    diagonal = positions[:white]
    until !valid_position?(diagonal)
      diagonal = diagonal.map { |p| p + 1 }
      return true if positions[:black] == diagonal
    end
  end

  def check_negative_x_negative_y?
    diagonal = positions[:white]
    until !valid_position?(diagonal)
      diagonal = diagonal.map { |p| p - 1 }
      return true if positions[:black] == diagonal
    end
  end

  def check_negative_x_positive_y?
    diagonal = positions[:white]
    until !valid_position?(diagonal)
      diagonal = diagonal.map.with_index do |p, index|
        if index == 0
          p - 1
        else
          p + 1
        end
      end
      return true if positions[:black] == diagonal
    end
  end

  def check_positive_x_negative_y?
    diagonal = positions[:white]
    until !valid_position?(diagonal)
      diagonal = diagonal.map.with_index do |p, index|
       if index == 0
        p + 1
       else
        p - 1
       end
      end
      return true if positions[:black] == diagonal
    end
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
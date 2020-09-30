class BinarySearch
  attr_reader :data

  def initialize(input)
    @data = input
  end

  def search_for(value)
    left_index = 0
    right_index = data.size - 1

    while left_index < right_index
      middle_index = (left_index + right_index) / 2
      middle_value = data[middle_index]
      
      case compare(middle_value, value)
      when :smaller
        left_index = middle_index + 1
      when :larger
        right_index = middel_index - 1
      when :equal
        return middle_index
      end
    end
  end

  private

  def compare(value1, value2)
    case value1 <=> value2
    when -1
      :smaller
    when 1
      :larger
    else
      :equal
    end
  end
end



class Payload
  
  def initialize
    @index = 0
  end

  def find_matching_pair(payload, target)
    return [] if @index == payload.length
    return [] if payload.length < 2

    current_num = payload[@index]
    payload.delete(payload[@index])
    payload.map do |num|
      return [current_num, num] if ((target - current_num) - num) == 0
    end
    payload << current_num
    @index += 1
    find_matching_pair(payload, target)
  end
end
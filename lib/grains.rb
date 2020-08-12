class Grains
  class << self
    def square(num)
      return "Invalid Square" if num < 1 || num > 64
      return num if num == 1 || num == 2
      
      square(num - 1) * 2
    end

    def total
      nums = (1..64).to_a
      nums.reduce(0) do |total, num|
        total += square(num)
      end
    end
  end
end
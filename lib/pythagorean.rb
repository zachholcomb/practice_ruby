class Triplet
  def initialize(a, b, c)
    @num1 = a
    @num2 = b
    @num3 = c
  end

  def sum
    @num1 + @num2 + @num3
  end

  def product
    @num1 * @num2 * @num3
  end

  def pythagorean?
    (@num1**2 + @num2**2) == (@num3**2) 
  end
  class << self
    def where(args = {})
      min_factor = args.fetch(:min_factor, 1)
      max_factor = args[:max_factor]
      sum = args[:sum]
      find_triplets(min_factor, max_factor, sum)
    end

    def find_triplets(min_factor, max_factor, sum)
      triplets = []
      (min_factor..max_factor).to_a.combination(3).each do |a, b, c|
        triplets << Triplet.new(a, b, c) if valid?(Triplet.new(a, b, c), sum)
      end 
      triplets
    end

    def valid?(triplet, sum)
      valid_pythagorean?(triplet) && valid_sum?(triplet, sum)
    end

    def valid_pythagorean?(triplet)
      triplet.pythagorean?
    end

    def valid_sum?(triplet, sum)
      return true if sum.nil?

      triplet.sum == sum
    end
  end
end
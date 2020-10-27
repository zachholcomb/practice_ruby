class Palindromes
  attr_accessor :min_factor, :max_factor, :palindromes

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor= max_factor
    @palindromes = []
  end

  def generate
    (min_factor..max_factor).to_a.repeated_permutation(2).to_a.map do |pair|
      factor = pair.reduce(&:*)
      if palindrome?(factor)
        @palindromes << factor
      end
    end
  end

  def palindrome?(num)
    num.to_s.reverse == num.to_s
  end

  def largest
    Palindrome.new(palindromes.max, min_factor..max_factor)
  end

  def smallest
    Palindrome.new(palindromes.min, min_factor..max_factor)
  end
end

class Palindrome < Palindromes
  attr_reader :value, :range, :results

  def initialize(value, range)
    @value = value
    @range = range
    @results = []
  end

  def factors
    nums = find_potential_factors
    nums.each do |num|
      check_square(num)
      check_product(nums, num)
    end
    results
  end

  def check_square(num)
    if square_num?(num)
      results << [num, num]
    end
  end

  def check_product(nums, num)
    product = nums.find{ |num2| num * num2 == value }
    if product
      unless duplicate_entries?(num, product)
        results << [num, product]
      end
    end
  end

  def square_num?(num)
    num * num == value
  end

  def duplicate_entries?(num, product)
    results.include?([num, product]) || results.include?([product, num])
  end

  def find_potential_factors
    range.find_all do |num|
      value % num == 0
    end
  end
end
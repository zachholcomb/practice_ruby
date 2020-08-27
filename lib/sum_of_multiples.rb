class SumOfMultiples
  def initialize(*args)
    @nums = args
  end

  def to(target)
    return 0 if @nums == [0]
    
    (0..(target-1)).find_all do |num1|
      @nums.any? { |num2| num1 % num2 == 0 }
    end.sum
  end
end
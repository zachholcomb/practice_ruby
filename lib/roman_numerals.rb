class RomanNumerals
  def initialize
    @key = {
      1000 => 'M',
       900 => 'CM',
       500 => 'D',
       400 => 'CD',
       100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
         9 => 'IX',
         5 => 'V',
         4 => 'IV',
         1 => 'I'
    }
    @converted = ''
  end

  def to_roman(num)
    return @converted if num == 0
    if @key.keys.include?(num)
      @converted << @key[num]
      to_roman(num - (@key.keys.find { |k| num == k }))
    else
      closest = @key.keys.find { |k| num > k }
      @converted << @key[closest] 
      to_roman((num - closest))
    end
  end
end
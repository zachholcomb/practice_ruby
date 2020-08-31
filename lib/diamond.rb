class Diamond
  class << self
    @letter = nil
    @key = nil

    def make_diamond(letter)
      setup(letter)
      return "A\n" if letter == "A"

      spacing = get_spacing(letter)
      final = build_top("", letter, spacing)
      build_bottom(final, letter, spacing)
    end

    def get_spacing(letter)
      spacing = ("A"..letter).to_a.length
      spacing + (spacing - 1)
    end

    def build_row(letter, spacing)
      if letter == "A"
        steps = spacing / 2
        ((" " * steps) + "A" + (" " * steps))+ "\n"
      elsif letter == @letter
        steps = spacing - 2
        "#{letter}" +  (" " * steps)  + "#{letter}" + "\n"
      else
        middle = " "  * @key[letter]
        outer = " " * (((spacing - @key[letter]) - 2) / 2)
        (outer + "#{letter}" + middle + "#{letter}" + outer) + "\n"
      end
    end

    def build_top(final, letter, spacing)
      ("A"..letter).each do |char|
        final += build_row(char, spacing)
      end
      final
    end

    def build_bottom(final, letter, spacing)
      ("A"...letter).to_a.reverse.each do |char|
        final += build_row(char, spacing)
      end
      final
    end

    def setup(letter)
      @letter = letter
      chars = ("A".."Z").to_a
      nums = (1..51).step(2).to_a.prepend(0)
      @key = Hash[chars.zip(nums)]
    end
  end
end
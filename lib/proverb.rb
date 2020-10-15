class Proverb
  attr_reader :proverb, :words, :qualifier

  def to_s
    proverb
  end

  private

  def initialize(*args, qualifier: nil)
    @words = args
    @proverb = ''
    @qualifier = qualifier
    set_verse
  end

  def set_verse
   words.map.with_index do |word, index|
      if index != (words.length - 1)
        @proverb << "For want of a #{word} the #{words[index + 1]} was lost.\n"
      elsif index == (words.length - 1)
        last_line
      end
    end
  end

  def last_line
    if qualifier.nil?
      proverb << "And all for the want of a #{words[0]}."
    else
      proverb << "And all for the want of a #{qualifier} #{words[0]}."
    end
  end
end
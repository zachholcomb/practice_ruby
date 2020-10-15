class Anagram
  def match(words)
    words.find_all do |word|
      check(word)
    end
  end

  private

  def initialize(word)
    @word = word
    @key = set_word_hash(word)
  end

  def check(word)
    word_hash = set_word_hash(word)
    @key == word_hash && word.downcase != @word.downcase
  end

  def set_word_hash(word)
    word.downcase.chars.reduce({}) do |acc, letter|
      if acc[letter].nil?
        acc[letter] = 1
      else
        acc[letter] += 1
      end
      acc
    end
  end
end
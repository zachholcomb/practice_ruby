class Alphametics
  class << self
    def solve(puzzle)
      words = puzzle.scan(/\b\w+\b/)
      letters = puzzle.scan(/[A-Z]/).uniq
      return {} if valid_expression?(words)

      (0..9).to_a.permutation(letters.count).each do |digits|
        key = Hash[*letters.zip(digits).flatten]
        next if !check_ones?(key, words)
        substitute = puzzle.gsub(/[A-Z]/, key)
        next if leading_zeros?(substitute)
        return key if eval(substitute)
       end
      {}
    end

    def valid_expression?(words)
      words.last.length < words.first.length
    end

    def check_ones?(set, words)
      if words[0..-2].any? { |word| word.length < words.last.length }
        set[words.last[0]] == 1
      end
    end

    def leading_zeros?(set)
      set.match(/(\s|\A)0/)
    end
  end
end

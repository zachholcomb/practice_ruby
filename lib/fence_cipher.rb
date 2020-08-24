class RailFenceCipher
  class << self
    def encode(message, number_of_rails)
      return message if message.empty? || number_of_rails == 1
      return message if number_of_rails > message.length

      zigzag(number_of_rails, message.length)
        .zip(message.chars)
        .sort
        .map { |set| set[1] }
        .join
    end

    def decode(message, number_of_rails)
      return message if message.empty? || number_of_rails == 1

      zigzag(number_of_rails, message.length)
        .sort
        .zip(message.chars)
        .sort_by { |set| set[0][1] }
        .map { |set| set[1] }
        .join
    end

    def zigzag(number_of_rails, size)
      pattern = (0..number_of_rails-1).to_a + (1..number_of_rails-2).to_a.reverse
      pattern.cycle.first(size).zip(0..size)
    end
  end
end


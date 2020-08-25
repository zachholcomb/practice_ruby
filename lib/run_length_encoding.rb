class RunLengthEncoding
  class << self
    def encode(input)
      return input if input.empty?

      key = split_message_into_chunks(input)
      encode_build_string(key)
    end

    def decode(input)
      return input if input.empty?

      key = split_message_into_nums_and_letters(input)
      decode_build_string(key)
    end

    private

    def encode_build_string(key)
      key.reduce('') do |encoded, set|
        if set.length >= 2
          encoded += "#{set.length}#{set[0]}"
        else
          encoded += set
        end
        encoded
      end
    end

    def split_message_into_chunks(message)
      message.each_char.chunk_while(&:==).map(&:join)
    end

    def decode_build_string(key)
      key.reduce('') do |decoded, set|
        if ('0'..'9').include?(set[0])
          num = set.scan(/\d/).join
          decoded +=  "#{(set[-1]) * num.to_i}"
        else
          decoded += set
        end
        decoded
      end
    end
    
    def split_message_into_nums_and_letters(message)
      message.each_char
             .chunk_while { |a| ('0'..'9').include?(a) }
             .map(&:join)
    end
  end
end
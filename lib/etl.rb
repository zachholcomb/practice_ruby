class ETL
  class << self
    def transform(old_input)
      old_input.reduce({}) do |acc, key|
        key[1].each do |letter|
          acc[letter.downcase] = key[0]
        end
        acc
      end
    end
  end
end
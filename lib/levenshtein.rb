class Levenshtein
  attr_reader :d, :length1, :length2, :str1, :str2

  def initialize(str1, str2)
    @str1 = str1
    @str2 = str2
    @length1 = str1.length
    @length2 = str2.length
    @d = Array.new(length1+1) {Array.new(length2+1)}
  end

  def distance
    grid
    (1..length2).each do |j|
      (1..length1).each do |i|
        if str2[j-1] == str1[i-1]
          d[i][j] = d[j-1][i-1]
        else
          d[i][j] = [d[i-1][j-1]+1, d[i][j-1]+1, d[i-1][j]+1].min
        end
      end 
    end
    d[length1][length2]
  end

  def grid
    (0..length1).each  do |i|
      d[i][0] = i
    end
    (0..length2).each do |j|
      d[0][j] = j
    end
  end
end
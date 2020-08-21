class Nucleotide
  class << self
    def from_dna(strand)
      @sequence = strand

      unless @sequence[/(A+|C+|G+|T+)+/] == @sequence || @sequence == ''
        raise ArgumentError, "Not Valid DNA string" 
      end
      self
    end

    def count(nucleotide)
      @sequence.count(nucleotide)
    end

    def histogram
      key = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
      @sequence.chars.each do |nucleotide|
        key[nucleotide] += 1
      end
      key
    end
  end
end
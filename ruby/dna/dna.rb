class DNA
  attr_reader :dna
  def initialize(dna)
      @dna = dna
  end

  def count(input = {})
    input.split('')
    if input.include?('ATCG')
      raise ArgumentError.new("Sorry, #{input} ")
    else
      dna.count(input)
    end
  end

  def nucleotide_counts
    if dna == ''
      {"A"=>0, "T"=>0, "C"=>0, "G"=>0}
    else
      counted_nucleotides = {"A"=>0, "T"=>0, "C"=>0, "G"=>0}
      split_dna = dna.split('')
      split_dna.each { |dna| counted_nucleotides[dna] += 1 }
      counted_nucleotides
    end
  end
end

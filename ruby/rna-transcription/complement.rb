class Complement
  DNA_TO_RNA = {
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
    'A' => 'U',
  }

  RNA_TO_DNA = DNA_TO_RNA.invert

  class << self
    foo =  { of_dna: DNA_TO_RNA, of_rna: RNA_TO_DNA}
    foo.each do |key, value|
      define_method(key) do |strand|
        strand.each_char.map do |nucleotide|
          value[nucleotide]
        end.join
      end
    end
  end

end

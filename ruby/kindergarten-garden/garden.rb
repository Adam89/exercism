class Garden
  DEFAULT_STUDENTS = [
    :alice, 
    :bob, 
    :charlie,
    :david, 
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry,
  ]

  MAPPINGS = {
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass,
    "V" => :violets,
  }

  def initialize(diagram, students=DEFAULT_STUDENTS)
    @diagram = diagram
    @students = students

    @students.sort_by(&:to_s).each.with_index do |person, index|
      self.singleton_class.send(:define_method, person.downcase) do
        @diagram.split("\n").map do |line|
          line[index*2,2].each_char.map {|letter| MAPPINGS[letter]}
        end.flatten
      end
    end

  end

end

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
      instance_eval(<<-RUBY, __FILE__, __LINE__ + 1)
        def #{person.downcase}
          @diagram.split("\n").map do |line|
            line[#{index*2},2].each_char.map {|letter| MAPPINGS[letter]}
          end.flatten
        end
       RUBY
    end

  end

end

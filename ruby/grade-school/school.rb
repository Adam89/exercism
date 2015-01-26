class School
  attr_reader :to_hash

  def initialize
    @to_hash = Hash.new([])
  end

  def add(name, grade)
    if to_hash[grade].empty?
      @to_hash[grade] += [name]
    else
      @to_hash[grade] << name
    end
  end

  def grade(year)
   @to_hash[year].sort
  end

  def sort
    Hash[sort_grades.zip(sort_names)]
  end

  def sort_names
    sort_grades.map do |k|
      @to_hash[k].sort
    end
  end

  def sort_grades
    @to_hash.keys.sort
  end
end

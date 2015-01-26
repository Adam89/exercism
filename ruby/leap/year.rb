class Year
  def self.leap?(annum)
    divisible_by_four?(annum) && !century?(annum) || exceptional_century?(annum)
  end

  def self.century?(annum)
    annum % 100 == 0
  end

  def self.divisible_by_four?(annum)
    annum % 4 == 0
  end

  def self.exceptional_century?(annum)
    annum % 400 == 0
  end
end

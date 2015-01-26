class ETL
  def self.transform(old_scrabble_system)
    #Never realised that both
    #inject and each_with_object behave very similarly
    #each_with_object returns the default object passed to it by default
    #Whereas with inject I have to explicitly return it

    #old_scrabble_system.inject({}) do |new_system, (score, letters)|
    #  letters.map { |letter| new_system[letter.downcase] = score }
    #  new_system
    #end

    old_scrabble_system.each_with_object({}) do |(score, letters), new_score|
      letters.map {|letter| new_score[letter.downcase] = score }
    end
  end
end

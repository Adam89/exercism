class Raindrops
  def convert(number)
    rain_code = {3 =>  "Pling",5 => "Plang",7 => "Plong"}
    rain_speech = []
    rain_code.keys.each do |prime_factor|
    rain_speech << rain_code[prime_factor] if number % prime_factor == 0
    end

    unless rain_speech.empty?
      rain_speech.join
    else
      number.to_s
    end

  end
end

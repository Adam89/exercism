class WordProblem
  attr_reader :question, :digits

  def initialize(math_question)
    @question = math_question
    @digits = all_digits.split(" ").count
    raise ArgumentError if digits < 2
  end


  def answer

    if digits == 2
      first, second = all_digits.split(" ")
    elsif digits == 3
      first, second, third = all_digits.split(" ")
    end

    math_operators[operator_as_word]

    expression =  if digits == 2
                    [first, math_operators[operator_as_word.first], second].join(" ")
                  elsif digits == 3
                    ["(",first, math_operators[operator_as_word.first], second, ")", math_operators[operator_as_word[1]], third].join(" ")
                  end

    eval(expression)
  end

  def all_digits
    question.gsub(/[^\d\-]/, ' ')
  end

  def math_operators
    {
      "plus" => "+",
      "minus" => "-",
      "multiplied" => "*",
      "divided" => "/"
    }
  end

  def operator_as_word
    operators = ["plus", "minus", "multiplied", "divided"]

    question.split(" ").select do |w|
      if operators.include? w
        w
      end
    end
  end

end

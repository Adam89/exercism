class WordProblem

  def initialize(math_question)
    @question = math_question
    @digits = all_digits.split(" ").count
    too_complex
  end


  def answer
    if digits == 2
      first, second = all_digits.split(" ")
    elsif digits == 3
      first, second, third = all_digits.split(" ")
    end


    expression_for_three = ["(",first, math_operators[operator_as_word.first], second, ")", math_operators[operator_as_word[1]], third].join(" ")
    expression_for_two = [first, math_operators[operator_as_word.first], second].join(" ")

    if digits == 2
      expression = expression_for_two 
    elsif digits == 3
      expression = expression_for_three
    end

    eval(expression)
  end

  private 

  attr_reader :question, :digits

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

  def too_complex
    raise ArgumentError if digits < 2
  end

  def operator_as_word
    operators = ["plus", "minus", "multiplied", "divided"]

    question.split(" ").select do |word|
      if operators.include? word
        word
      end
    end
  end

end

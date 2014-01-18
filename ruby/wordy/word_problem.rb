class WordProblem
  attr_reader :question

  def initialize(math_question)
    @question = math_question
  end

  def answer
    digits = all_digits.split(" ").count

    if digits == 2
      first, second = all_digits.split(" ")
    elsif digits == 3
      first, second, third = all_digits.split(" ")
    end

    math_operators[operator_as_word]

    expression =  if digits == 2
        [first, math_operators[operator_as_word], second].join(" ")
      elsif digits == 3
        [first, math_operators[operator_as_word], second, math_operators[operator_as_word], third].join(" ")
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
    question[/plus|minus|multiplied|divided/]
  end

end

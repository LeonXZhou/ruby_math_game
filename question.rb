class Question
  attr_reader :question

  def initialize()
    create_question()
  end

  def check_answer(player_answer)
    player_answer == answer
  end

  private
  attr_accessor :answer
  attr_writer :question

  def create_question()
    number1 = rand(20) + 1
    number2 = rand(20) + 1
    self.answer = number1 + number2
    self.question = "What does #{number1} plus #{number2} equal?"
  end
end

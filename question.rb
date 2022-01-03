class Question
  attr_reader :question, :answer

  def initialize()
    create_question()
  end


  private

  attr_writer :question, :answer

  def create_question()
    number1 = rand(20) + 1
    number2 = rand(20) + 1
    self.answer = number1 + number2
    self.question = "What does #{number1} plus #{number2} equal?"
  end
end

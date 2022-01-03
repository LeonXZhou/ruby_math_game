class Player
  attr_reader :lives, :name
  def initialize(name,lives = 3)
    self.lives = lives
    @name = name
  end

  def decrement_life()
    self.lives -= 1
  end

  private
  attr_writer :lives

end
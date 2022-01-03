class Player
  attr_accessor :lives, :name
  def initialize(name,lives = 3)
    self.lives = lives
    self.name = name
  end
end
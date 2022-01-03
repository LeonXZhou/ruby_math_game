require "./player"
require "./question"

class Gameloop
  attr_accessor :players, :turn

  def initialize()
    self.turn = 0
    self.players = []
    self.players << Player.new('Player1')
    self.players << Player.new('Player2')
  end

  def run()
    while (self.players[0].lives > 0 && self.players[1].lives > 0)
      #create new question and determine which player's turn it is
      question = Question.new()
      which_player = self.turn % 2;

      ##prompts user with question and get user answer
      puts self.players[which_player].name  + ": #{question.question}"
      player_answer = Integer(gets.chomp) rescue false

      ##if answer is not an integer the user will be prompted for a new iput
      while !player_answer
        puts "hey dummy I need an non decimal number (0,1,2,3,4,5...)"
        puts self.players[which_player].name  + ": #{question.question}"
        player_answer = Integer(gets.chomp) rescue false
      end

      ## access the user answer and outputs correct prompt
      if (question.answer != player_answer)
        reduce_lives(self.players[which_player])
        puts self.players[which_player].name  + ": Seriously? No!"
      else
        puts self.players[which_player].name  + ": Yes! You are correct."  
      end

      ##increment turn counter
      self.turn += 1

      ## output end of turn prompts while game is not over
      if (self.players[0].lives > 0 && self.players[1].lives > 0)
        puts "P1: #{self.players[0].lives}/3 P2: #{self.players[1].lives}/3" 
        puts "----- NEW TURN -----"
      end
      
    end

    ## output gameover prompts
    if (self.players[0].lives > 0)
      puts "#{self.players[0].name} wins with a score of #{self.players[0].lives}/3"
    else
      puts "#{self.players[1].name} wins with a score of #{self.players[1].lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  
  end

  private
  def reduce_lives(player_instance)
    player_instance.lives = player_instance.lives - 1
  end
end

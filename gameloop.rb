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
    while (both_players_are_alive)
      #create new question and determine which player's turn it is
      question = Question.new()
      which_player = self.turn % 2;

      #promps user and get answer
      player_answer = prompt_user(question,which_player)

      ## access the user answer and outputs correct prompt
      process_answer(question,player_answer,which_player)

      ## output end of turn prompts while game is not over
      wrap_up_turn()
    end

    ## output gameover prompts
    wrap_up_game()
  
  end

  private
  def prompt_user(question,which_player)
          ##prompts user with question and get user answer
          puts self.players[which_player].name  + ": #{question.question}"
          player_answer = Integer(gets.chomp) rescue false
    
          ##if answer is not an integer the user will be prompted for a new iput
          while !player_answer
            puts "hey dummy I need an non decimal number (0,1,2,3,4,5...)"
            puts self.players[which_player].name  + ": #{question.question}"
            player_answer = Integer(gets.chomp) rescue false
          end
          player_answer
  end

  def process_answer(question,player_answer,which_player)
    if (question.check_answer(player_answer))
      puts self.players[which_player].name  + ": Yes! You are correct."  
    else
      self.players[which_player].decrement_life()
      puts self.players[which_player].name  + ": Seriously? No!"
    end
  end

  def wrap_up_turn()
    ##increment turn counter
    self.turn += 1
    if (both_players_are_alive)
      puts "P1: #{self.players[0].lives}/3 P2: #{self.players[1].lives}/3" 
      puts "----- NEW TURN -----"
    end
  end

  def wrap_up_game()
    if (self.players[0].lives > 0)
      puts "#{self.players[0].name} wins with a score of #{self.players[0].lives}/3"
    else
      puts "#{self.players[1].name} wins with a score of #{self.players[1].lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end

  def both_players_are_alive
    self.players[0].lives > 0 && self.players[1].lives > 0
  end

end

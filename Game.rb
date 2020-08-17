require_relative './Player.rb'

class Game

  attr_reader :answer

  def initialize

    
    # Create 2 Players
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @active_player = nil

    # Create player array, and shuffle order
    @players = [@player1, @player2].shuffle


    # Numbers to sum
    @num1 = nil
    @num2 = nil
    @answer = nil


    @rounds = 1

    @game_over = false

  end

  def random_numbers
    @num1 = rand(20)
    @num2 = rand(20)
    @answer = @num1 + @num2
  end

  def alive_players
    @players.select {|player| !player.dead}
  end

  def end_game
    alive_players.count == 1
  end

  def get_winner
    @players.select { | player | player.dead != true }
  end

  def next_turn

    @active_player = @players.first

    puts "Player #{@active_player.playerNum}: What does #{@num1} plus #{@num2} equal?"
    player_answer = gets.to_i

    if player_answer == @answer
      puts 'Correct!'
    else 
      puts 'Wrong!'
      @active_player.lose_life

      if @active_player.lives == 0
        @active_player.dead =  true
      end
    
    end


    @rounds += 1

    puts "Status: Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    puts '----------------------------------------------------'

    #  The rotate method will change the order of the  array
    #  Personal note that the ! means that it will modify the original array
    @players.rotate!

  end

  def play

    until end_game do
      random_numbers
      next_turn
    end

    puts '--------- Game Over! --------- '
    puts "The winner is Player #{get_winner.first.playerNum}, and it took #{@rounds} rounds!"

  end

end

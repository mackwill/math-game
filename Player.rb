class Player
  attr_accessor :playerNum, :lives, :dead

  def initialize(playerNum)
    @playerNum = playerNum
    @lives = 3
    @dead = false
    
  end


  def lose_life
    @lives -= 1
  end
  
  
end


# p = Player.new(1)
# puts p.playerNum
# puts p.lives
# p.lose_life
# puts p.lives
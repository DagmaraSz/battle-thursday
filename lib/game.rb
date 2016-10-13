class Game

  attr_reader :players

  DAMAGE = 10

  def initialize(player1, player2)
    @players = [player1, player2]
  end

  def attack(player)
    player.reduce_health(DAMAGE)
  end

  def switch
    players.reverse!
  end
end

class Game

  DAMAGE = 10

  def attack(player)
    player.reduce_health(DAMAGE)
  end
end

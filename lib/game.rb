class Game

  attr_reader :players, :was_attack

  DAMAGE = 10

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
    @was_attack = false
  end

  def set_current_player(player_string)
    player = check_player(player_string)
    switch_to(player)
  end

  def attack(player)
    player.reduce_health(DAMAGE)
    @was_attack = true
  end

  private

  attr_reader :player1, :player2

  def check_player(player_string)
    if player_string == "p1"
      player1
    elsif player_string == "p2"
      player2
    end
  end

  def current_player
    players[0]
  end

  def switch_to(player)
    @players.reverse! if player != current_player
  end

end

class Game

  attr_reader :players, :was_attack, :loser, :was_lost, :player1, :player2

  DAMAGE = rand(20)

  def self.create(player1, player2)
     @@game = Game.new(player1, player2)
  end

  def self.game
    @@game
  end

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

  def attack(player, attack_type)
    case attack_type
    when "standard"
      standard_attack(player)
    when "heal"
      heal(player)
    end
    @was_attack = true
  end

  def lose(player)
    @was_lost = true
    @loser = player
  end


  private

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

  def standard_attack(player)
    lose(player) if "dead" == player.reduce_health(DAMAGE)
  end

  def heal(player)
    player.increase_health(DAMAGE)
  end

end

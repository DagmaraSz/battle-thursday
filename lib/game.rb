class Game

  attr_reader :players, :was_attack, :loser, :was_lost, :player1, :player2, :attack_message

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
    @attack_message = []
  end

  def set_current_player(player_string)
    player = check_player(player_string)
    switch_to(player)
  end

  def attack(player, attack_type)
    poison_damage(players[0]) if players[0].poisoned
    if players[0].sleeping && (chance(0.4) || players[0].paralysed)
      @attack_message << "#{players[0].name} wakes up"
      players[0].wake_up
      return
    end
    return @attack_message << "#{players[0].name} is sleeping" if players[0].sleeping && !players[0].paralysed
    case attack_type.to_s
      when "standard"
        standard_attack(player)
        @attack_message << "#{players[0].name} attacks #{players[1].name}"
      when "heal"
        heal(players[0])
        @attack_message << "#{players[0].name} is healed"
      when "poison"
        poison_attack(player)
        @attack_message << "#{players[0].name} attempts to poison #{players[1].name}"
      when "sleep"
        sleep_attack(player)
        @attack_message << "#{players[0].name} puts #{players[1].name} to sleep"
      when "paralyse"
        paralyse_attack(player)
        @attack_message << "#{players[0].name} attempts to paralyse #{players[1].name}"
    end
    @was_attack = true
  end

  def lose(player)
    @was_lost = true
    @loser = player
  end

  private
  def chance(probability)
    rand > probability ? false : true
  end

  def paralyse_attack(player)
    if chance(0.5)
      player.sleep
      player.paralyse
    end
    player.reduce_health((damage * 0.5).round)
  end

  def poison_attack(player)
    lose(player) if "dead" == player.reduce_health((damage * 0.6).round)
    player.poison if chance(0.8)
  end

  def poison_damage(player)
    player.reduce_health(4)
  end

  def sleep_attack(player)
    player.sleep
  end

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
    lose(player) if "dead" == player.reduce_health(damage)
  end

  def heal(player)
    player.increase_health(damage)
  end

  def damage
    rand(1..20)
  end

end

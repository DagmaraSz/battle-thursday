class Player
  attr_reader :name, :hp, :poisoned

  TOTAL_HEALTH = 100

  def initialize
    @hp = TOTAL_HEALTH
  end

  def reduce_health(damage)
    @hp -= damage
    dead
  end

  def increase_health(damage)
    @hp += (damage * 0.7).round
  end

  def set_name(name)
    @name = name
  end

  def poison
    @poisoned = true
  end

  private

  def dead
    "dead" if @hp <= 0
  end

end

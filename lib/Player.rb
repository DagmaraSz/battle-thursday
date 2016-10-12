class Player
  attr_reader :name, :hp

  TOTAL_HEALTH = 100

  def initialize(name)
    @name = name
    @hp = TOTAL_HEALTH
  end

  def reduce_health(damage)
    @hp -= damage
  end
end

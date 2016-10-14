class Player
  attr_reader :name, :hp, :poisoned, :sleeping, :paralysed

  TOTAL_HEALTH = 100

  def initialize
    @hp = TOTAL_HEALTH
    @sleeping = false
    @poisoned = false
    @paralysed = false
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

  def sleep
    @sleeping = true
  end

  def paralyse
    @paralysed = true
  end

  def wake_up
    @sleeping = false
  end

  private

  def dead
    "dead" if @hp <= 0
  end

end

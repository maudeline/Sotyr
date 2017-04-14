class CookingSkill

  attr_reader :level

  def initialize(level = 0)
    @level = level
  end

  def increase(dish)
    @level += 1
  end
end

class CookingSkill

  attr_reader :level

  def initialize
    @level = 0
  end

  def increase(amount)
    @level += amount
  end
end

require 'dish'
require 'cooking_skill'

class CookingProcess
  attr_reader :appliance, :ingredients, :equiptment

  def initialize(appliance, chef)
    @appliance = appliance
    @chef = chef
  end

  def with(ingredients)
    @ingredients = ingredients
    self
  end

  def in(equiptment)
    @equiptment = equiptment
    self
  end

  def begin
    if new_chef?
      chef.add_new_skill(cooking: CookingSkill.new)
    end
    chef.increase_skill(:cooking, 1)
    Dish.new
  end

  private

  attr_reader :chef

  def new_chef?
    !chef.view_skills.include?(:cooking)
  end
end

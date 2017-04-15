require 'dish'
require 'cooking_skill'

class CookingProcess
  attr_reader :appliance, :ingredients, :equiptment

  def initialize(appliance, chef)
    @appliance = appliance
    @chef = chef
    @ingredients = []
    @equiptment = []
  end

  def with(ingredients)
    @ingredients = ingredients if available?(:ingredient, ingredients)
    self
  end

  def in(equiptment)
    @equiptment = equiptment if available?(:equiptment, equiptment)
    self
  end

  def begin
    cookbook = chef.cookbook
    exists = cookbook.recipe_exists?(appliance, ingredients, equiptment)
    chef.add_new_skill(cooking: CookingSkill.new) if new_chef?
    dish = Dish.new(appliance, ingredients, equiptment, chef.skill_level(:cooking))
    chef.increase_skill(:cooking, dish)
    dish.quality(exists, 0)
    dish
  end

  private

  attr_reader :chef

  def available?(type, ingredients)
    available_ingredients = chef.available_items(type)
    ingredients.map { |ingredient| return false unless available_ingredients.include?(ingredient) }
  end

  def new_chef?
    !chef.view_skills.include?(:cooking)
  end
end

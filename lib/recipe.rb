class Recipe
  attr_reader :name, :ingredients, :cooking_method, :required_skill_level, :known

  def initialize(name, ingredients, cooking_method, required_skill_level, quality)
    @name = name
    @ingredients = ingredients
    @cooking_method = cooking_method
    @required_skill_level = required_skill_level
    @times_made = 0
    @known = false
    @quality = quality
  end

  def make(appliance, ingredients, equiptment, chef_skill)
    @known = true
    dish = Dish.new(appliance, ingredients, equiptment, chef_skill, times_made, quality)
    @times_made + 1
    dish
  end

  private

  attr_reader :times_made, :quality
end

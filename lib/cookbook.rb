require 'recipe'

class Cookbook
  RECIPES = {
    fried_egg: Recipe.new('fried egg', [:egg], :fry)
  }.freeze

  def initialize
    @known_recipes = {}
    @times_made = {}
  end

  def recipe_exists?(appliance, ingredients, equiptment)
    RECIPES.any? { |_, recipe| matches?(recipe, ingredients, appliance, equiptment) }
  end

  def recipe_made(appliance, ingredients, equiptment)
    recipe = RECIPES.select { |name, recipe| name if matches?(recipe, ingredients, appliance, equiptment) }
    known_recipes.merge!(recipe)
    count_times_made(recipe.keys.first)
  end

  def recipes
    known_recipes.keys
  end

  def dish_count(recipe_name)
    times_made[recipe_name]
  end

  private

  attr_accessor :known_recipes, :times_made

  def count_times_made(recipe_name)
    current_count = current_count(recipe_name)
    times_made[recipe_name] = current_count += 1
  end

  def current_count(recipe_name)
    times_made.key?(recipe_name) ? times_made[recipe_name] : 0
  end

  def matches?(recipe, ingredients, appliance, equiptment)
    ingredients_match?(recipe, ingredients) && cooking_methods_match?(recipe, equiptment, appliance)
  end

  def ingredients_match?(recipe, ingredients)
    ingredient_names = ingredients.map(&:name)
    recipe.ingredients.sort == ingredient_names.sort
  end

  def cooking_methods_match?(recipe, equiptment, appliance)
    cooking_method = appliance.cooking_method(equiptment.first)
    recipe.cooking_method == cooking_method
  end
end

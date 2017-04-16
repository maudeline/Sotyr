require 'recipe'

class Cookbook
  def initialize(recipes)
    @recipes = recipes
  end

  def create_dish(appliance, ingredients, equiptment, skill_level)
    recipe = get_recipe(appliance, ingredients, equiptment)
    recipe.make(appliance, ingredients, equiptment, skill_level)
  end

  def view_recipes
    recipes
  end

  private

  attr_accessor :recipes, :known_recipes

  def get_recipe(appliance, ingredients, equiptment)
    recipe = recipes.find { |recipe| matches?(recipe, ingredients, appliance, equiptment) }
    exists?(recipe) ? recipe : create_recipe(appliance, ingredients, equiptment)
  end

  def create_recipe(appliance, ingredients, equiptment)
    recipe = Recipe.new('unknown', ingredients, appliance.cooking_method(equiptment.first), 0, :bad)
    recipes << recipe
    recipe
  end

  def exists?(recipe)
    recipe != nil
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

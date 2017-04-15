require 'recipe'

class Cookbook

  RECIPES = {
    fried_egg: Recipe.new('fried egg', [:egg], :fry)
  }

  def recipe_exists?(appliance, ingredients, equiptment)
    RECIPES.map { |_, recipe| return true if matches?(recipe, ingredients, appliance, equiptment) }
  end

  private

  def matches?(recipe, ingredients, appliance, equiptment)
    ingredients_match?(recipe, ingredients) && cooking_methods_match?(recipe, equiptment, appliance)
  end

  def ingredients_match?(recipe, ingredients)
    ingredient_names = ingredients.map { |ingredient| ingredient.name }
    recipe.ingredients.sort == ingredient_names.sort
  end

  def cooking_methods_match?(recipe, equiptment, appliance)
    cooking_method = appliance.cooking_method(equiptment.first)
  end
end

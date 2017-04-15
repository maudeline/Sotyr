class Recipe
  attr_reader :name, :ingredients, :cooking_method

  def initialize(name, ingredients, cooking_method)
    @name = name
    @ingredients = ingredients
    @cooking_method = cooking_method
  end
end

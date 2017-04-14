class Dish

  QUALITY = {
    bad: 0,
    poor: 1,
    normal: 2,
    good: 3,
    excellent: 4,
    perfect: 5
  }

  def initialize(appliance, ingredients, equiptment, skill_level)
    @ingredients = ingredients
  end

  def quality
    calculate_ingredient_quality
  end

  private

  attr_reader :ingredients

  def calculate_ingredient_quality
     sum_quality / ingredients.length
  end

  def sum_quality
    ingredients.inject(0) { |acc, ingredient| acc + QUALITY[ingredient.quality] }
  end
end

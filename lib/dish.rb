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
    @equiptment = equiptment
  end

  def quality
    ingredient_quality = calculate_quality(ingredients)
    equiptment_quality = calculate_quality(equiptment)
    ingredient_quality + equiptment_quality
  end

  private

  attr_reader :ingredients, :equiptment

  def calculate_quality(items)
    return 0 if items.empty?
    sum_quality(items) / items.length
  end

  def sum_quality(items)
    items.inject(0) { |acc, item| acc + QUALITY[item.quality] }
  end
end

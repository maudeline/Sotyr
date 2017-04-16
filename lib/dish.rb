class Dish
  QUALITY = {
    bad: 0,
    poor: 1,
    normal: 2,
    good: 3,
    excellent: 4,
    perfect: 5
  }.freeze

  DISH_QUALITY = {
    130  => :perfect,
    104  => :excellent,
    78  => :good,
    53  => :normal,
    26  => :poor,
    0 => :bad
  }.freeze

  def initialize(appliance, ingredients, equiptment, skill_level, times_made, recipe_quality)
    @appliance = appliance
    @ingredients = ingredients
    @equiptment = equiptment
    @skill_level = skill_level
    @times_made = times_made
    @recipe_quality = recipe_quality
  end

  def quality
    calculated_quality = calculate_dish_quality
    DISH_QUALITY.each { |score, quality| return quality if calculated_quality >= score }
  end

  private

  attr_reader :ingredients, :equiptment, :appliance, :recipe_quality, :skill_level, :times_made
  def calculate_dish_quality
    ingredient_quality = calculate_quality(ingredients)
    equiptment_quality = calculate_quality(equiptment)
    appliance_quality = QUALITY[appliance.quality]
    ingredient_quality + equiptment_quality + appliance_quality + QUALITY[recipe_quality] + skill_level + times_made
  end

  def calculate_quality(items)
    return 0 if items.empty?
    sum_quality(items) / items.length
  end

  def sum_quality(items)
    items.inject(0) { |acc, item| acc + QUALITY[item.quality] }
  end
end

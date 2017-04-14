require 'dish'

class CookingProcess
  attr_reader :appliance, :ingredients, :equiptment

  def initialize(appliance)
    @appliance = appliance
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
    Dish.new
  end
end

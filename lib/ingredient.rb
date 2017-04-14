class Ingredient
  attr_reader :name, :type, :quality

  def initialize(name, quality)
    @name = name
    @quality = quality
    @type = :ingredient
  end
end

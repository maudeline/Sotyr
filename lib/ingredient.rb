class Ingredient
  attr_reader :name, :type

  def initialize(name)
    @name = name
    @type = :ingredient
  end
end

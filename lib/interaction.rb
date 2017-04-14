class Interaction
  def self.between(object, character)
    new(object, character)
  end

  def options
    object.available_actions_for(character)
  end

  def interact(option)
    object.interact(option) if available?(option)
  end

  private

  attr_reader :object, :character

  def initialize(object, character)
    @object = object
    @character = character
  end

  def available?(option)
    object.available_actions_for(character).include?(option)
  end
end

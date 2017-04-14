class MainCharacter
  attr_reader :name, :items

  def initialize
    @name = 'pan'
    @items = []
  end

  def pick_up(item)
    items << item
  end

  def interact_with(object)
    Interaction.between(object, self)
  end
end

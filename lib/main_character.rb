class MainCharacter
  attr_reader :name, :items

  def initialize
    @name = 'pan'
    @items = []
    @skills = {}
  end

  def pick_up(item)
    items << item
  end

  def interact_with(object)
    Interaction.between(object, self)
  end

  def skill_level(skill)
    skills.fetch(skill)
  end

  def view_skills
    skills.keys
  end

  def add_new_skill(skill)
    skills.merge!(skill)
  end

  private

  attr_accessor :skills
end

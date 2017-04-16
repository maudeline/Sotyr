require 'interaction'

class MainCharacter
  attr_reader :name, :items, :cookbook

  def initialize(cookbook)
    @name = 'pan'
    @items = []
    @skills = {}
    @cookbook = cookbook
    @current_location = nil
  end

  def pick_up(item)
    items << item
  end

  def interact_with(object)
    Interaction.between(object, self)
  end

  def skill_level(skill)
    skills.fetch(skill).level
  end

  def view_skills
    skills.keys
  end

  def add_new_skill(skill)
    skills.merge!(skill)
  end

  def increase_skill(skill, amount)
    skills.fetch(skill).increase(amount)
  end

  def available_items(type)
    items.select { |item| item.type == type }
  end

  def move_to(location)
    @current_location= location
  end

  def location
    current_location
  end

  private

  attr_accessor :skills, :current_location
end

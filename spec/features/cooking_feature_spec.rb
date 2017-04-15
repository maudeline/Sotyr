require 'main_character'
require 'fire'
require 'ingredient'
require 'equiptment'
require 'recipe'
require 'cookbook'

describe 'Cooking' do
  let(:fire) { Fire.new(:perfect) }
  let(:egg) { Ingredient.new(:egg, :perfect) }
  let(:pan) { Equiptment.new(:pan, :perfect) }
  let(:recipe) { Recipe.new('fried egg', [egg], :fry, 0, :good) }
  let(:cookbook) { Cookbook.new([recipe]) }
  let(:character) { MainCharacter.new(cookbook) }

  it 'main character can cook a dish from ingredients' do
    character.pick_up(egg)
    character.pick_up(pan)
    interaction = character.interact_with(fire)
    process = interaction.interact(:cook).with([egg]).in([pan])
    dish = process.begin

    expect(dish).to_not be nil
  end

  it 'skill level increases when cooking is done' do
    character.pick_up(egg)
    character.pick_up(pan)
    interaction = character.interact_with(fire)
    process = interaction.interact(:cook).with([egg]).in([pan])
    dish = process.begin

    expect(character.skill_level(:cooking)).to_not be 0
  end
end

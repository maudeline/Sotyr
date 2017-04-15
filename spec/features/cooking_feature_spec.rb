require 'main_character'
require 'fire'
require 'ingredient'
require 'equiptment'

describe 'Cooking' do
  it 'main character can cook a dish from ingredients' do
    character = MainCharacter.new
    fire = Fire.new
    egg = Ingredient.new(:egg, :perfect)
    pan = Equiptment.new(:pan, :perfect)

    character.pick_up(egg)
    character.pick_up(pan)
    interaction = character.interact_with(fire)
    process = interaction.interact(:cook).with([egg]).in([pan])
    dish = process.begin

    expect(dish).to_not be nil
  end

  it 'skill level increases when cooking is done' do
    character = MainCharacter.new
    fire = Fire.new
    egg = Ingredient.new(:egg, :perfect)
    pan = Equiptment.new(:pan, :perfect)

    character.pick_up(egg)
    character.pick_up(pan)
    interaction = character.interact_with(fire)
    process = interaction.interact(:cook).with([egg]).in([pan])
    dish = process.begin

    expect(character.skill_level(:cooking)).to_not be 0
  end
end

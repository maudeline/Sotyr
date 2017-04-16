require 'main_character'
require 'interaction'
require 'cooking_skill'
require 'ingredient'
require 'location'

describe MainCharacter do
  let(:cookbook) { instance_double(Cookbook) }
  let(:character) { described_class.new(cookbook) }

  it 'has a name' do
    expect(character.name).to eq('pan')
  end

  it 'can pick up items' do
    item = double(:item)

    character.pick_up(item)

    expect(character.items.first).to eq(item)
  end

  it 'can interact with objects' do
    object = double(:object)

    expect(Interaction).to receive(:between).with(object, character)

    character.interact_with(object)
  end

  context 'skills' do
    let(:cooking_skill) { instance_spy(CookingSkill) }

    it 'has no skills initially' do
      expect(character.view_skills).to be_empty
    end

    it 'can add a skill' do
      character.add_new_skill(cooking: cooking_skill)

      expect(character.view_skills.first).to be(:cooking)
    end

    it 'can increase a skill' do
      character.add_new_skill(cooking: cooking_skill)

      character.increase_skill(:cooking, 1)

      expect(cooking_skill).to have_received(:increase).with(1)
    end
  end

  context 'items' do
    let(:ingredient) { instance_spy(Ingredient) }

    it 'lists available ingredients' do
      allow(ingredient).to receive(:type).and_return(:ingredient)

      character.pick_up(ingredient)
      ingredients = character.available_items(:ingredient)

      expect(ingredients).to include(ingredient)
    end
  end

  context 'movement' do
    let(:location) { instance_spy(Location) }

    it 'can move to a location' do
      character.move_to(location)

      expect(character.location).to eq(location)
    end
  end
end

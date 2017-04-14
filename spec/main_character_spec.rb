require 'main_character'
require 'interaction'
require 'cooking_skill'

describe MainCharacter do
  let(:character) { described_class.new }

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
    let(:cooking_skill) { instance_double(CookingSkill) }

    it 'has no skills initially' do
      expect(character.view_skills).to be_empty
    end

    it 'can add a skill' do
      character.add_new_skill(cooking: cooking_skill)

      expect(character.view_skills.first).to be(:cooking)
    end
  end
end

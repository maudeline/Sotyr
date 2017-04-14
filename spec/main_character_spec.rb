require 'main_character'
require 'interaction'

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
end

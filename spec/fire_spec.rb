require 'fire'
require 'main_character'

describe Fire do
  let(:fire) { Fire.new(:perfect) }
  let(:character) { instance_double(MainCharacter) }

  context 'available actions' do
    it 'can be used for cooking' do
      actions = fire.available_actions_for(character)

      expect(actions).to include(:cook)
    end
  end

  context 'cooking' do
    it 'begins a new cooking process' do
      expect(CookingProcess).to receive(:new).with(fire, character)

      process = fire.interact(:cook, character)
    end
  end
end

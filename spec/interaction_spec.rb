require 'interaction'
require 'game_object'

describe Interaction do
  let(:object_spy) { instance_spy(GameObject) }
  let(:character) { double(:character) }

  it 'can be created with an object and character' do
    interaction = described_class.between(object_spy, character)

    expect(interaction).to_not be nil
  end

  context 'options' do
    let(:interaction) { described_class.between(object_spy, character) }

    before do
      allow(object_spy).to receive(:available_actions_for).and_return([:option])
    end

    it 'checks the options for the interaction' do
      interaction.options

      expect(object_spy).to have_received(:available_actions_for).with(character)
    end

    it 'returns the options for the interaction' do
      options = interaction.options

      expect(object_spy).to have_received(:available_actions_for).with(character)
      expect(options.first).to eq(:option)
    end

    it 'can select an option' do
      interaction.interact(:option)

      expect(object_spy).to have_received(:interact).with(:option, character)
    end

    it 'cannot select an option if not available' do
      interaction.interact(:invalid_option)

      expect(object_spy).not_to have_received(:interact)
    end
  end
end

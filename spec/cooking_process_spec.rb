require 'cooking_process'
require 'main_character'
require 'ingredient'
require 'pan'

describe CookingProcess do
  let(:appliance) { double(:appliance) }
  let(:ingredient) { instance_double(Ingredient) }
  let(:pan) { instance_double(Pan) }
  let(:character_spy) { instance_spy(MainCharacter) }
  let(:process) { described_class.new(appliance, character_spy) }

  context 'ingredients' do
    it 'can add ingredients' do
      allow(character_spy).to receive(:available_items).and_return([ingredient])

      process_with_ingredients = process.with([ingredient])

      expect(process_with_ingredients.ingredients).to include(ingredient)
    end

    it 'cannot add ingredients chef does not have' do
      allow(character_spy).to receive(:available_items).and_return([])

      process_with_ingredients = process.with([ingredient])

      expect(process_with_ingredients.ingredients).to be_empty
    end
  end

  context 'equiptment' do
    it 'can add equiptment' do
      allow(character_spy).to receive(:available_items).and_return([ingredient, pan])

      process_with_equiptment = process.in([pan])

      expect(process_with_equiptment.equiptment).to eq([pan])
    end

    it 'cannot use equipment chef does not have' do
      allow(character_spy).to receive(:available_items).and_return([ingredient])

      process_with_equiptment = process.in([pan])

      expect(process_with_equiptment.equiptment).to be_empty
    end
  end

  before do
    allow(character_spy).to receive(:available_items).and_return([ingredient, pan])
  end

  it 'can begin' do
    allow(character_spy).to receive(:view_skills).and_return([])
    process_with_equiptment = process.with([ingredient]).in([pan])

    dish = process_with_equiptment.begin

    expect(dish).to_not be nil
  end

  context 'skill' do
    let(:cooking_process) { process.with([ingredient]).in([pan]) }

    it 'adds cooking skill to user' do
      allow(character_spy).to receive(:view_skills).and_return([])

      cooking_process.begin

      expect(character_spy).to have_received(:add_new_skill)
    end

    it 'does not add skill if it exists' do
      allow(character_spy).to receive(:view_skills).and_return([:cooking])

      cooking_process.begin

      expect(character_spy).not_to have_received(:add_new_skill)
    end

    it 'increases cooking skill' do
      allow(character_spy).to receive(:view_skills).and_return([:cooking])

      cooking_process.begin

      expect(character_spy).to have_received(:increase_skill)
    end
  end
end

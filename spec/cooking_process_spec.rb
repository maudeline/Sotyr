require 'cooking_process'
require 'main_character'

describe CookingProcess do
  let(:appliance) { double(:appliance) }
  let(:ingredient) { double(:ingredient) }
  let(:pan) { double(:pan) }
  let(:character_spy) { instance_spy(MainCharacter) }
  let(:process) { described_class.new(appliance, character_spy) }

  it 'can add ingredients' do
    process_with_ingredients = process.with([ingredient])

    expect(process_with_ingredients.ingredients).to include(ingredient)
  end

  it 'can add equiptment' do
    process_with_equiptment = process.with([ingredient]).in(pan)

    expect(process_with_equiptment.equiptment).to eq(pan)
  end

  it 'can begin' do
    allow(character_spy).to receive(:view_skills).and_return([])
    process_with_equiptment = process.with([ingredient]).in(pan)

    dish = process_with_equiptment.begin

    expect(dish).to_not be nil
  end

  context 'skill' do
    let(:cooking_process) { process.with([ingredient]).in(pan)}

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
  end
end

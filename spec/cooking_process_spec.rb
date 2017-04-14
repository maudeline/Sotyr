require 'cooking_process'

describe CookingProcess do
  let(:appliance) { double(:appliance) }
  let(:ingredient) { double(:ingredient) }
  let(:pan) { double(:pan) }
  let(:process) { described_class.new(appliance) }

  it 'can add ingredients' do
    process_with_ingredients = process.with([ingredient])

    expect(process_with_ingredients.ingredients).to include(ingredient)
  end

  it 'can add equiptment' do
    process_with_equiptment = process.with([ingredient]).in(pan)

    expect(process_with_equiptment.equiptment).to eq(pan)
  end

  it 'can begin' do
    process_with_equiptment = process.with([ingredient]).in(pan)

    dish = process_with_equiptment.begin

    expect(dish).to_not be nil
  end
end

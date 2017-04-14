require 'ingredient'

describe Ingredient do
  let(:ingredient) { described_class.new(:egg) }

  it 'has a name' do
    expect(ingredient.name).to eq(:egg)
  end
end

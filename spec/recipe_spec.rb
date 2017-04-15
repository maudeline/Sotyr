require 'recipe'
require 'fire'
require 'ingredient'
require 'equiptment'

describe Recipe do
  let(:appliance) { instance_double(Fire, quality: :good) }
  let(:equiptment) { instance_double(Equiptment, name: :pan, quality: :good) }
  let(:ingredient) { instance_double(Ingredient, name: :egg, quality: :good) }

  it 'can be made' do
    recipe = described_class.new('fried egg', [ingredient], :fry, 0, :good)

    dish = recipe.make(appliance, [ingredient], [equiptment], 0)

    expect(recipe.known).to be(true)
    expect(dish).not_to be nil
  end
end

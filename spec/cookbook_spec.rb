require 'cookbook'
require 'fire'
require 'equiptment'
require 'ingredient'
require 'recipe'

describe Cookbook do
  let(:appliance) { instance_double(Fire, cooking_method: :fry) }
  let(:equiptment) { instance_double(Equiptment, name: :pan) }
  let(:recipe) { instance_spy(Recipe, ingredients: [:egg], cooking_method: :fry) }
  let(:cookbook) { described_class.new([recipe]) }

  it 'creates the dish if recipe is known' do
    ingredient = instance_double(Ingredient, name: :egg)

    cookbook.create_dish(appliance, [ingredient], [equiptment], 0)

    expect(recipe).to have_received(:make)
  end

  it 'creates a dish if recipe is known' do
    ingredient = instance_double(Ingredient, name: :unknown)

    dish = cookbook.create_dish(appliance, [ingredient], [equiptment], 0)

    expect(dish).not_to be nil
  end
end

require 'cookbook'
require 'fire'
require 'equiptment'

describe Cookbook do

  let(:appliance) { instance_double(Fire) }
  let(:equiptment) { instance_double(Equiptment, name: :pan) }
  let(:ingredient) { instance_double(Ingredient, name: :egg) }
  let(:cookbook) { described_class.new }

  it 'knows if recipe exists' do
    allow(appliance).to receive(:cooking_method).with(equiptment).and_return(:fry)

    exists = cookbook.recipe_exists?(appliance, [ingredient], [equiptment])

    expect(exists).to be true
  end
end

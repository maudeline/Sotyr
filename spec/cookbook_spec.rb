require 'cookbook'
require 'fire'
require 'equiptment'
require 'ingredient'

describe Cookbook do
  let(:appliance) { instance_double(Fire) }
  let(:equiptment) { instance_double(Equiptment, name: :pan) }
  let(:ingredient) { instance_double(Ingredient, name: :egg) }
  let(:cookbook) { described_class.new }

  context 'known recipes' do
    before do
      allow(appliance).to receive(:cooking_method).with(equiptment).and_return(:fry)
    end

    it 'knows if recipe exists' do
      exists = cookbook.recipe_exists?(appliance, [ingredient], [equiptment])

      expect(exists).to be true
    end

    it 'remembers made recipes' do
      cookbook.recipe_made(appliance, [ingredient], [equiptment])

      expect(cookbook.recipes).to include(:fried_egg)
    end

    it 'remembers how many times a recipe has been made' do
      cookbook.recipe_made(appliance, [ingredient], [equiptment])
      cookbook.recipe_made(appliance, [ingredient], [equiptment])

      expect(cookbook.dish_count(:fried_egg)).to be 2
    end
  end

  context 'unknown recipes' do
    it 'knows if recipe does not exists' do
      allow(appliance).to receive(:cooking_method).with(equiptment).and_return(:grill)

      exists = cookbook.recipe_exists?(appliance, [ingredient], [equiptment])

      expect(exists).to be false
    end

    it 'does not know recipes not made yet' do
      allow(appliance).to receive(:cooking_method).with(equiptment).and_return(:fry)

      expect(cookbook.recipes).to be_empty
    end
  end
end

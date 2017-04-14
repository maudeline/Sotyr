require 'dish'
require 'ingredient'
require 'appliance'
require 'equiptment'

describe Dish do

    let(:ingredient) { instance_double(Ingredient) }
    let(:appliance) { instance_double(Appliance) }
    let(:equiptment) { instance_double(Equiptment) }

  context 'ingredients' do

    let(:skill_level) { 0 }

    it 'bad quality ingredients do not add to quality' do
      allow(ingredient).to receive(:quality).and_return(:bad)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 0
    end

    it 'poor quality ingredients add one to quality' do
      allow(ingredient).to receive(:quality).and_return(:poor)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 1
    end

    it 'normal quality ingredients add two to quality' do
      allow(ingredient).to receive(:quality).and_return(:normal)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 2
    end

    it 'good quality ingredients add three to quality' do
      allow(ingredient).to receive(:quality).and_return(:good)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 3
    end


    it 'excellent quality ingredients create a better dish' do
      allow(ingredient).to receive(:quality).and_return(:excellent)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 4
    end

    it 'perfect quality ingredients create a better dish' do
      allow(ingredient).to receive(:quality).and_return(:perfect)

      dish = Dish.new(appliance, [ingredient], [equiptment], skill_level)

      expect(dish.quality).to eq 5
    end
  end
end

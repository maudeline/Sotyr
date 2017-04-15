require 'dish'
require 'ingredient'
require 'appliance'
require 'equiptment'

describe Dish do
  let(:ingredient) { instance_double(Ingredient) }
  let(:appliance) { instance_double(Appliance) }
  let(:equiptment) { instance_double(Equiptment) }
  let(:skill_level) { 0 }
  let(:times_made) { 0 }

  context 'recipe' do
    let(:dish) { Dish.new(appliance, [], [], skill_level, times_made, :bad) }

    before do
      allow(appliance).to receive(:quality).and_return(:bad)
    end

    it 'has a higher quality if recipe exists' do
      expect(dish.quality(true, 0)).to eq 10
    end
  end

  context 'ingredients' do
    before do
      allow(appliance).to receive(:quality).and_return(:bad)
    end

    let(:dish) { Dish.new(appliance, [ingredient], [], skill_level, times_made, :bad) }

    it 'bad quality ingredients do not add to quality' do
      allow(ingredient).to receive(:quality).and_return(:bad)

      expect(dish.quality(true, 0)).to eq 10
    end

    it 'poor quality ingredients add one to quality' do
      allow(ingredient).to receive(:quality).and_return(:poor)

      expect(dish.quality(true, 0)).to eq 11
    end

    it 'normal quality ingredients add two to quality' do
      allow(ingredient).to receive(:quality).and_return(:normal)

      expect(dish.quality(true, 0)).to eq 12
    end

    it 'good quality ingredients add three to quality' do
      allow(ingredient).to receive(:quality).and_return(:good)

      expect(dish.quality(true, 0)).to eq 13
    end

    it 'excellent quality ingredients create a better dish' do
      allow(ingredient).to receive(:quality).and_return(:excellent)

      expect(dish.quality(true, 0)).to eq 14
    end

    it 'perfect quality ingredients create a better dish' do
      allow(ingredient).to receive(:quality).and_return(:perfect)

      expect(dish.quality(true, 0)).to eq 15
    end
  end

  context 'equiptment' do
    let(:dish) { Dish.new(appliance, [], [equiptment], skill_level, times_made, :bad) }

    before do
      allow(appliance).to receive(:quality).and_return(:bad)
    end

    it 'bad quality equiptments do not add to quality' do
      allow(equiptment).to receive(:quality).and_return(:bad)

      expect(dish.quality(true, 0)).to eq 10
    end

    it 'poor quality equiptments add one to quality' do
      allow(equiptment).to receive(:quality).and_return(:poor)

      expect(dish.quality(true, 0)).to eq 11
    end

    it 'normal quality equiptments add two to quality' do
      allow(equiptment).to receive(:quality).and_return(:normal)

      expect(dish.quality(true, 0)).to eq 12
    end

    it 'good quality equiptments add three to quality' do
      allow(equiptment).to receive(:quality).and_return(:good)

      expect(dish.quality(true, 0)).to eq 13
    end

    it 'excellent quality equiptments create a better dish' do
      allow(equiptment).to receive(:quality).and_return(:excellent)

      expect(dish.quality(true, 0)).to eq 14
    end

    it 'perfect quality equiptments create a better dish' do
      allow(equiptment).to receive(:quality).and_return(:perfect)

      expect(dish.quality(true, 0)).to eq 15
    end
  end

  context 'appliance' do
    let(:dish) { Dish.new(appliance, [], [], skill_level, times_made, :bad) }

    it 'bad quality appliances do not add to quality' do
      allow(appliance).to receive(:quality).and_return(:bad)

      expect(dish.quality(true, 0)).to eq 10
    end

    it 'poor quality appliances add one to quality' do
      allow(appliance).to receive(:quality).and_return(:poor)

      expect(dish.quality(true, 0)).to eq 11
    end

    it 'normal quality appliances add two to quality' do
      allow(appliance).to receive(:quality).and_return(:normal)

      expect(dish.quality(true, 0)).to eq 12
    end

    it 'good quality appliances add three to quality' do
      allow(appliance).to receive(:quality).and_return(:good)

      expect(dish.quality(true, 0)).to eq 13
    end

    it 'excellent quality appliances create a better dish' do
      allow(appliance).to receive(:quality).and_return(:excellent)

      expect(dish.quality(true, 0)).to eq 14
    end

    it 'perfect quality appliances create a better dish' do
      allow(appliance).to receive(:quality).and_return(:perfect)

      expect(dish.quality(true, 0)).to eq 15
    end
  end
end

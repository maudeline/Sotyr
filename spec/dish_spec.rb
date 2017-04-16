require 'dish'
require 'ingredient'
require 'appliance'
require 'equiptment'

describe Dish do
  let(:ingredient) { instance_double(Ingredient) }
  let(:appliance) { instance_double(Appliance) }
  let(:equiptment) { instance_double(Equiptment) }

  context 'quality' do
    it 'can be a perfect dish' do
      allow(appliance).to receive(:quality).and_return(:perfect)
      allow(ingredient).to receive(:quality).and_return(:perfect)
      allow(equiptment).to receive(:quality).and_return(:perfect)

      dish = described_class.new(appliance, [ingredient], [equiptment], 100, 10, :perfect)

      expect(dish.quality).to eq :perfect
    end

    it 'can be an excellent dish' do
      allow(appliance).to receive(:quality).and_return(:excellent)
      allow(ingredient).to receive(:quality).and_return(:excellent)
      allow(equiptment).to receive(:quality).and_return(:excellent)

      dish = described_class.new(appliance, [ingredient], [equiptment], 80, 8, :excellent)

      expect(dish.quality).to eq :excellent
    end

    it 'can be an good dish' do
      allow(appliance).to receive(:quality).and_return(:good)
      allow(ingredient).to receive(:quality).and_return(:good)
      allow(equiptment).to receive(:quality).and_return(:good)

      dish = described_class.new(appliance, [ingredient], [equiptment], 60, 6, :good)

      expect(dish.quality).to eq :good
    end

    it 'can be an normal dish' do
      allow(appliance).to receive(:quality).and_return(:normal)
      allow(ingredient).to receive(:quality).and_return(:normal)
      allow(equiptment).to receive(:quality).and_return(:normal)

      dish = described_class.new(appliance, [ingredient], [equiptment], 40, 4, :good)

      expect(dish.quality).to eq :normal
    end

    it 'can be an poor dish' do
      allow(appliance).to receive(:quality).and_return(:poor)
      allow(ingredient).to receive(:quality).and_return(:poor)
      allow(equiptment).to receive(:quality).and_return(:poor)

      dish = described_class.new(appliance, [ingredient], [equiptment], 20, 2, :poor)

      expect(dish.quality).to eq :poor
    end
  end
end

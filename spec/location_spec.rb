require 'location'

describe Location do
  it 'has a name' do
    location = described_class.new(:name, [])

    expect(location.name).to be :name
  end

  it 'can have objects in' do
    fire = instance_double(Fire)
    egg = instance_double(Ingredient)

    location = described_class.new(:name, [fire, egg])

    expect(location.contents).to include(fire)
  end
end

require 'location'

describe Location do
  it 'can have objects in' do
    fire = instance_double(Fire)
    egg = instance_double(Ingredient)

    location = described_class.new([fire, egg])

    expect(location.contents).to include(fire)
  end
end

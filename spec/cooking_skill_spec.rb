describe CookingSkill do
  it 'has an initial level' do
    skill = described_class.new

    expect(skill.level).to eq 0
  end
end

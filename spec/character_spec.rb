require './lib/character'



RSpec.describe do

  it 'exists and can fetch name, actor, and salary' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})

    expect(kitt.name).to eq('KITT')
    expect(kitt.actor).to eq('William Daniels')
    expect(kitt.salary).to eq(1000000)
  end






end

require './lib/character'
require './lib/show'

RSpec.describe do

  it 'can pass iteration 2' do
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    expect(knight_rider.name).to eq("Knight Rider")
    expect(knight_rider.creator).to eq("Glen Larson")
    expect(knight_rider.characters).to be_a(Array)
    expect(knight_rider.characters.first).to be_a(Character)
    expect(knight_rider.characters.length).to eq(2)
    expect(knight_rider.total_salary).to eq(2600000)
    expect(knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])


  end



end

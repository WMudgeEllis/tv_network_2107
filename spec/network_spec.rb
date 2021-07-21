require './lib/network'
require './lib/show'
require './lib/character'


RSpec.describe do

  it 'can pass iteration 3' do
    nbc = Network.new("NBC")

    expect(nbc.name).to eq("NBC")
    expect(nbc.shows).to eq([])

    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    expect(nbc.shows).to eq([knight_rider, parks_and_rec])
    expect(nbc.main_character).to eq([kitt])
    expect(nbc.actors_by_show).to eq({
      knight_rider => ["David Hasselhoff", "William Daniels"],
      parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      })
  end

  it 'can pass iteration 4' do
    nbc = Network.new("NBC")
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)
    nbc.add_show(baywatch)

    expect(nbc.show_by_actor).to eq({
      "David Hasselhoff" => [knight_rider, baywatch],
      "William Daniels" => [knight_rider],
      "Amy Poehler" => [parks_and_rec],
      "Nick Offerman" => [parks_and_rec]
      })

    expect(nbc.prolific_actors).to eq(["David Hasselhoff"])

  end

  it 'can find a show by actor' do
    nbc = Network.new("NBC")
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])
    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    nbc.add_show(parks_and_rec)

    expect(nbc.find_show_by_actor("Nick Offerman")).to eq([parks_and_rec])
  end


end

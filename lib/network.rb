class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_character
    all_characters = @shows.flat_map do |show|
      show.characters
    end.uniq

    all_characters.find_all do |character|
      character.salary > 500_000 && character.name.upcase == character.name
    end
  end

  def actors_by_show
    actors_show = {}
    @shows.each do |show|
      actors_show[show] = show.actors
    end
    actors_show
  end
end

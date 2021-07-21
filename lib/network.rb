class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def all_characters
    @shows.flat_map do |show|
      show.characters
    end.uniq
  end

  def main_character
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

  def find_show_by_actor(actor)
    @shows.find_all do |show|
      show.actors.include?(actor)
    end

  end

  def show_by_actor
    actor_show_hash = {}
    all_characters.each do |character|
      actor_show_hash[character.actor] = find_show_by_actor(character.actor)
    end
    actor_show_hash
  end

  def prolific_actors
    prolific = []
    show_by_actor.each do |actor, shows|
      if shows.length >1
        prolific << actor
      end
    end
    prolific
  end
end

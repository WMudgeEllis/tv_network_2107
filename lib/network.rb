class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def actors_by_show
    actors_show = {}
    @shows.each do |show|
      actors_show[show] = show.actors
    end
    actors_show

  end
end

class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    salary = 0
    @characters.each do |character|
      salary += character.salary
    end
    salary
  end

  def actors
    @characters.map do |character|
      character.actor
    end
  end

end

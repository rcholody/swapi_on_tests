class Character
  attr_reader :name
  attr_reader :species

  def initialize(name:, species:)
    @name = name
    @species = species
  end

  def is_human?
    species.empty?
  end
end

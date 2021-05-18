class CharacterValidator

  def initialize(character)
    @character = character
  end

  def validate!
    raise ArgumentError.new("name must be present") unless character.name
    raise ArgumentError.new("race must be present") unless character.species
    raise TypeError.new("race must be collection") unless character.species.respond_to? :each
    true
  end

  private

  attr_reader :character
end

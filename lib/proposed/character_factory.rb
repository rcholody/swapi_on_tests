require_relative './character'
require_relative './character_validator'

class CharacterFactory
  def self.build(data)
    character = Character.new(
      name: data['name'],
      species: data['species']
    )
    return character if CharacterValidator.new(character).validate!
  end
end

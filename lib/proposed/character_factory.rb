class CharacterFactory
  def self.build(data)
    character = Character.new(
      name: data['name'],
      species: data['species']
    )
    return character unless CharacterValidator.new(character).validate!
  end
end

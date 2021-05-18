class CharacterFactory
  def self.build(data)
    Character.new(
      name: data['name'],
      species: data['species']
    )
  end
end

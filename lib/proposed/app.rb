class App
  def is_human?(name: )
    characters_data = Swapi.search(name)
    return unless characters_data
    characters_data.each do |data|
      character = CharacterFactory.build(data)
      next unless character
      message = character.is_human? ? "#{character.name} is human" : "#{character.name} is not human"
      Logger.log(message)
    end
  end
end

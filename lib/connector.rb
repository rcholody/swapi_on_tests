require '../lib/swapi_client'
require '../lib/character'


class Connector
  def initialize(name)
    swapi_client = SwapiClient.new

    data_for_character = swapi_client.search(name)
    unless data_for_character.nil?
      data_for_character #TODO move it connector
      character = Character.new #TODO handle this in better way
      #TODO here probably I need builder in action
      character.is_human?(data_for_character)
    end
  end

  #TODO it also should use Character buidler here
end


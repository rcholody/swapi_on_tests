require_relative '../lib/swapi_client'
require_relative '../lib/character'


class Connector
  def initialize(name)
    swapi_client = SwapiClient.new(name)

    data_for_character = swapi_client.search
    unless data_for_character.nil?
      data_for_character #TODO move it connector
      character = Character.new(data_for_character) #TODO handle this in better way
      #TODO here probably I need builder in action
      character.is_human?
    end
  end

  #TODO it also should use Character buidler here
end


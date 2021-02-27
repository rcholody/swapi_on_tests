require '../lib/swapi_client'
require '../lib/character'


class Connector
 def initialize(name)
   swapi_client = SwapiClient.new

   response = swapi_client.search(name)
   character = Character.new
   #TODO here probably I need builder in action 
   character.is_human?(response)
 end

  #TODO it also should use Character buidler here
  # Than should return the repsosne of is_human to is_human.rb
end


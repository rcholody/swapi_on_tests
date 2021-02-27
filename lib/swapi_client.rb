#TODO HEre should I have some imports for JSON parers, API connection etc
require 'httparty'

#
class SwapiClient

  def search(name)
    HTTParty.get("https://swapi.dev/api/people/?search=#{name}")
  end
end
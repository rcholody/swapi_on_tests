#TODO HEre should I have some imports for JSON parers, API connection etc
require 'httparty'


class SwapiClient

  #TODO Here handle bad Dooku request
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def search
    begin
      response = HTTParty.get("https://swapi.dev/api/people/?search=#{name}")
    rescue HTTParty::Error, SocketError => e
      puts('API not available')
    end
    unless response.nil?
      case response.code
      when 200
        body = JSON.parse(response.body)
        if body["results"].empty?
          p "There are no results in entered name."
          nil
        else
          body["results"]
        end
      when 404
        puts "Page not found! Maybe bad internet?"
        nil
      when 500...600
        puts "Something went wrong. ERROR: #{response.code}"
        nil
      end
    end
  end
end
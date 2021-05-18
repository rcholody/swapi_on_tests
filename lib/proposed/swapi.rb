require 'httparty'
require 'singleton'
require_relative './logger'

class Swapi
  include HTTParty
  base_uri 'https://swapi.dev/api'

  class ErrorHandler
    ERROR_MESSAGES = {
      404 => 'Page not found! Maybe bad internet?',
      500...600 => 'Something went wrong.'
    }

    def self.call(response)
      Logger.error(
        "#{response.code} - #{ERROR_MESSAGES[response.code]}"
      )
    end
  end

  def self.search(query)
    response = get("/people/?search=#{query}")
    return ErrorHandler.call(response) unless is_success?(response)
    body = JSON.parse(response.body)
    body["results"]
  rescue HTTParty::Error, SocketError => e
    Logger.error('API not available')
  end

  private

  def self. is_success?(response)
    response.code.eql? 200
  end

end

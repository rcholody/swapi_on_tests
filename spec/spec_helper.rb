require 'simplecov'
SimpleCov.start

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
  config.before(:each) do
    swapi_response = {
        :status => 'success',
        :data => [{
                      "count": 1,
                      "next": nil,
                      "previous": nil,
                      "results": [
                          {
                              "name": "Luke Skywalker",
                              "height": "172",
                              "mass": "77",
                              "hair_color": "blond",
                              "skin_color": "fair",
                              "eye_color": "blue",
                              "birth_year": "19BBY",
                              "gender": "male",
                              "homeworld": "http://swapi.dev/api/planets/1/",
                              "films": [
                                  "http://swapi.dev/api/films/1/",
                                  "http://swapi.dev/api/films/2/",
                                  "http://swapi.dev/api/films/3/",
                                  "http://swapi.dev/api/films/6/"
                              ],
                              "species": [],
                              "vehicles": [
                                  "http://swapi.dev/api/vehicles/14/",
                                  "http://swapi.dev/api/vehicles/30/"
                              ],
                              "starships": [
                                  "http://swapi.dev/api/starships/12/",
                                  "http://swapi.dev/api/starships/22/"
                              ],
                              "created": "2014-12-09T13:50:51.644000Z",
                              "edited": "2014-12-20T21:17:56.891000Z",
                              "url": "http://swapi.dev/api/people/1/"
                          }
                      ]
                  }]
    }
    stub_request(:get, "https://swapi.dev/api/people/?search=luke").
        to_return(status: 200, body: swapi_response.to_json)
  end

end
module Helpers
  def fake_stdin(text)
      begin
        $stdin = StringIO.new
        $stdin.puts(text)
        $stdin.rewind
        yield
      ensure
        $stdin = STDIN
      end
  end
end
RSpec.configure do |conf|
  conf.include(Helpers)
end
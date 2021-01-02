require 'simplecov'
SimpleCov.start

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
  config.before(:each) do
    swapi_response = {
        :status => 'success',
        :data => []
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
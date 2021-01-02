require 'simplecov'
SimpleCov.start

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

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
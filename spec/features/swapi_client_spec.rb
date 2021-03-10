require_relative '../../spec/spec_helper'
require_relative '../../lib/swapi_client'


describe SwapiClient do
  subject(:api) { described_class.new(name) }

  let(:name) { 'luke' }

  describe '#search' do
    let(:swapi_url) { "https://swapi.dev/api/people/?search=#{name}" }
    let(:swapi_response) { instance_double(HTTParty::Response, body: swapi_response_body) }
    let(:swapi_response_body) { 'response_body' }

    before do
      allow(HTTParty).to receive(:get).and_return(swapi_response)
      allow(JSON).to receive(:parse)

      api.search
    end

    it 'search from SWAPI api' do
      expect(HTTParty).to have_received(:get).with(swapi_url)
    end

    it 'parses the SWAPI response' do
      expect(JSON).to have_received(:parse).with(swapi_response_body)
    end
  end

  describe 'SomeClient#request' do
    # before {allow(client).to receive(:some_lib).with(no_args).and_return(some_lib)}
    before {allow(client).to receive(:swapi_response).with(no_args).and_return(swapi_resposne)}

    # let(:client) {SomeClient.new}
    let(:client) {SwapiClient.new}
    # let(:some_lib) {spy(SomeLib)} # It's OK to use `instance_double` instead, I describe the difference afterward.
    # Maybe I should receive with connector???
    let(:some_lib) {spy(:swapi_response)} # It's OK to use `instance_double` instead, I describe the difference afterward.
    let(:expected_body) {}
    let(:expected_json) {JSON.parse expected_body}

    subject {client.request}

    it do
      is_expected.to eq expected_json
      expect(some_lib).to have_received(:request).with(no_args).and_return(expected_boby).once
    end
    #TODO how to handle it with paremeter Luke etc, what it will exepect?
  end

  describe 'search connection to API' do
    let(:swapi_response) {SwapiClient.search('luke')}
    it "returns correctly some data" do
      expect(swapi_response).to be_kind_of(Hash)
      expect(swapi_response).to have_key(:status)
      expect(swapi_response).to have_key(:data)
    end
  end
  describe 'search result from API' do
    let(:swapi) {SwapiClient.search('luke')}

    it "returns correct format with data" do
      expect(swapi).to swapi_response #swapi_response from mock spec_helper
    end

  end
  context "when problem with external API" do
    #TODO How to make this failing, can I search for sth which failing and expect to response eq error?
    let(:swapi_response) {SwapiClient.search('luke')}
    it "should not allow creation of an application" do
      expect(response.status).to eq(500)
      expect(swapi_response.parse(response.body)["status"]).to eq("error")
    end
  end
end

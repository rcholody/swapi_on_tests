# require_relative './../example'

describe SwapiClient do
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

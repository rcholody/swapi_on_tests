# require_relative './../example'

describe SwapiClient do
  describe 'employees' do
    let(:swapi_response) { SwapiClient.search('luke') }
    it "returns correctly some data" do
      expect(swapi_response).to be_kind_of(Hash)
      expect(swapi_response).to have_key(:status)
      expect(swapi_response).to have_key(:data)
    end
  end
end

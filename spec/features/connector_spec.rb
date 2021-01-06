describe Connector do
  describe "connector" do
    it "can connect to external API with search method" do
      #TODO need to figure it out how pass "search" as correct parameter
      connector_response = Connector.connect(SwapiAPI, search)
      expect(connector_response).to be_kind_of(Hash)
    end
    it "can handle error" do
      #TODO need to figure it out how pass "bad_search" as correct parameter
      bad_connector_response = Connector.connect(SwapiAPI, bad_search)
      expect(bad_connector_response.parse(response.body)["status"]).to eq("error")
    end
  end
end
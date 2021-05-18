require_relative '../../lib/proposed/swapi'
require_relative '../spec_helper'

describe Swapi do
  let(:query) { 'luke' }
  let(:search_uri) { "https://swapi.dev/api/people/?search=#{query}" }
  subject(:search_request) { Swapi.search(query) }

  context 'when success' do
    before do
      stub_request(:get, search_uri)
        .to_return(status: 200, body: luke_response, headers: {})
    end

    it 'properly returns response' do
      response = search_request
      expect(response).not_to be_empty
      expect(response.size).to eq 1
      expect(response.first["name"].downcase).to include query
    end

    it 'parses JSON response' do
      allow(JSON).to receive(:parse).and_return({ "results": [] })
      search_request
      expect(JSON).to have_received(:parse).once
    end

  end

  context 'when 404' do
    before do
      stub_request(:get, search_uri)
        .to_return(status: 404, body: "[]", headers: {})
      allow(Swapi::ErrorHandler).to receive(:call)
    end

    it 'handles error' do
      search_request
      expect(Swapi::ErrorHandler).to have_received(:call).once
    end

    it 'does not return response' do
      response = Swapi.search(query)
      expect(response).to be nil
    end

  end

  context 'when 500' do
    before do
      stub_request(:get, search_uri)
        .to_return(status: 500, body: "[]", headers: {})
      allow(Swapi::ErrorHandler).to receive(:call)
    end

    it 'handles error' do
      search_request
      expect(Swapi::ErrorHandler).to have_received(:call).once
    end

    it 'does not return response' do
      response = search_request
      expect(response).to be nil
    end
  end

end

require_relative '../../lib/proposed/app'
require_relative '../../lib/proposed/swapi'
require_relative '../../lib/proposed/character_factory'
require_relative '../../lib/proposed/logger'

describe App do
  subject(:app) { described_class.new }
  let(:name) { 'luke' }

  describe '#is_human?' do
    it 'checks starwars character is human' do
      # TODO interesuje Cię tak naprawdę czy wszystko jest dobrze pospinane :)
    end
  end

end


require_relative '../../lib/proposed/character'
require_relative '../../lib/proposed/character_factory'
require_relative '../../lib/proposed/character_validator'

describe CharacterFactory do
  describe '.build!' do
    let(:data) { { 'name' => 'name', 'species' => [] } }
    subject(:factory) { described_class }

    it 'builds character' do
      output = factory.build(data)
      expect(output).to be_truthy
      expect(output).to be_an_instance_of Character
    end

    context 'when character invalid' do
      let(:validator) { instance_double(CharacterValidator) }
      before do
        allow(CharacterValidator).to receive(:new).with(anything).and_return(validator)

        allow(validator).to receive(:validate!).and_return(false)
      end

      it 'returns nil' do
        output = factory.build(data)
        expect(output).to be nil
      end
    end
  end
end

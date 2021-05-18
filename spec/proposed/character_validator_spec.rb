require_relative '../../lib/proposed/character_validator'
require_relative '../../lib/proposed/character'

describe CharacterValidator do
  subject(:validator) { described_class.new(character) }
  let(:character) { Character.new(name: 'John', species: [] ) }

  it 'validates character' do
    expect(validator.validate!).to be_truthy
  end

  context 'with missing name' do
    let(:character) { Character.new(name: nil, species: [])}

    it 'raises ArgumentError' do
      expect { validator.validate! }.to raise_error ArgumentError
    end
  end

  context 'with missing species' do
    let(:character) { Character.new(name: 'John', species: nil) }

    it 'raises ArgumentError' do
      expect { validator.validate! }.to raise_error ArgumentError
    end
  end

  context 'when species is not a collection' do
    let(:character) { Character.new(name: 'John', species: 'Doe') }

    it 'raises TypeError' do
      expect { validator.validate! }.to raise_error TypeError
    end
  end
end

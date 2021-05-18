require_relative '../../lib/proposed/character'

describe Character do
  let(:params) { { name: 'Luke', species: [] } }
  let(:character) { Character.new(name: params[:name], species: params[:species]) }

  it 'character has accessible name' do
    expect(character.name).to eq params[:name]
  end

  it 'character has accessible species' do
    expect(character.species).to eq params[:species]
  end

  describe '#is_human?' do

    context 'when is human' do
      let(:params) { { name: 'Luke', species: [] } }

      it 'returns true' do
        expect(character.is_human?).to be_truthy
      end
    end

    context 'when is not human' do
      let(:params) { { name: 'Yoda', species: ['yoda'] } }

      it 'returns false' do
        expect(character.is_human?).to be_falsey
      end
    end
  end
end

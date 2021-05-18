require_relative '../../lib/proposed/character'

describe Character do
  let(:params) { { name: 'Luke', species: 'human' } }
  let(:character) { Character.new(name: params[:name], species: params[:species]) }

  it 'character has accessible name' do
    expect(character.name).to eq params[:name]
  end

  it 'character has accessible species' do
    expect(character.species).to eq params[:species]
  end
end

# require_relative './lib/character'
# require './lib/character'
require_relative '../../lib/character.rb'




describe Character, type: :model do
  describe 'character behaviour' do

    context 'validation test' do
      it 'ensures  species presence' do
        character = Character.new(name: "Luke Skywalker")
        expect(character).to eq(false)
      end

      it 'save correctly model with species presence' do
        character = Character.new(name: "Luke Skywalker", species: "human")
        expect(character).to eq(true)
      end

      describe '#is_human?' do
        it 'should return true when species is human' do

          character = Character.new(name: "Luke Skywalker", species: "human")
          expect(character).to receive(:species).and_return("human")

          human_status = character.is_human?

          expect(human_status).to be_truthy
        end

        it 'should return false when species is not human' do
          character = Character.new(name: "Luke Skywalker", species: "zeltron")
          expect(character).to receive(:species).and_return("zeltron")

          human_status = character.is_human?

          expect(human_status).to be_falsey
        end

        it 'should return false when there is no species' do
          character = Character.new(name: "Luke Skywalker")

          human_status = character.is_human?

          expect(human_status).to be_falsey
        end
      end
    end
  end


end

require_relative '../classes/author'
require_relative '../classes/game'


describe Game do
  before :each do
    @new_game = Game.new(true, '2020-08-09', '1110-09-09', 'game')
  end

  context 'While testing the game class' do
    it 'Inserted data should match attributes' do
        expect(@new_game.multiplayer[0]).to eql(true)
        expect(@new_game.last_played_at.year).to eql(2020)
    end

    it 'check if it can be archived' do
        expect(@new_game.can_be_archived?).to eq true
      end

    
  end
end

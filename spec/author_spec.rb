require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
  before :each do
    @new_author = Author.new('Daniel', 'Samuel')
  end

  context 'While testing the author class' do
    it 'Inserted data should match attributes' do
      expect(@new_author.first_name).to eql 'Daniel'
      expect(@new_author.last_name).to eql 'Samuel'
    end

    it 'check the add_item method' do
      new_game = Game.new(true, '2020-08-09', '1110-09-09', 'game')
      @new_author.add_item(new_game)
      expect(@new_author.items.length).to eql(1)
    end
  end
end

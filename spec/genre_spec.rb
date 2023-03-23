require './classes/genre'
require './classes/item'

describe Genre do
  describe '#initialize' do
    it 'sets the genre name' do
      genre = Genre.new('Jazz')
      expect(genre.name).to eq('Jazz')
    end

    it 'sets the genre ID to a random value between 1 and 1000' do
      genre = Genre.new('Pop')
      expect(genre.id).to be_between(1, 1000).inclusive
    end

    it 'initializes an empty array of items' do
      genre = Genre.new('Rock')
      expect(genre.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds the item to the genre' do
      genre = Genre.new('Jazz')
      item = Item.new(Date.today, false)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
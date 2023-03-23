require './classes/item'

describe Item do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:archived) { false }
  let(:item) { Item.new(publish_date, archived) }

  describe '#initialize' do
    it 'should set the id' do
      expect(item.id).not_to be_nil
    end

    it 'should set the publish date' do
      expect(item.instance_variable_get(:@publish_date)).to eq(publish_date)
    end

    it 'should set the archived flag' do
      expect(item.instance_variable_get(:@archived)).to eq(archived)
    end
  end

  describe '#add_genre=' do
    let(:genre) { instance_double(Genre, name: 'Fiction', items: []) }

    it 'should set the genre' do
      item.add_genre = genre
      expect(item.instance_variable_get(:@genre)).to eq(genre.name)
    end

    it 'should add the item to the genre' do
      item.add_genre = genre
      expect(genre.items).to include(item)
    end

    it 'should not add the item to the genre if it is already there' do
      genre.items << item
      item.add_genre = genre
      expect(genre.items.count(item)).to eq(1)
    end
  end

  describe '#move_to_archive' do
    context 'when item can be archived' do
      it 'should set the archived flag to true' do
        allow(item).to receive(:can_be_archived?).and_return(true)
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(true)
      end
    end

    context 'when item cannot be archived' do
      it 'should not set the archived flag to true' do
        allow(item).to receive(:can_be_archived?).and_return(false)
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(false)
      end
    end
  end
end
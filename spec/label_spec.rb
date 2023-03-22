require_relative '../classes/label'
require_relative '../classes/book'

RSpec.describe Label do 
  gift = Label.new('Gift', 'Blue')
  book = Book.new('12-01-2007', 'London Books', 'bad')
  gift.add_item(book)

  it 'Should include: book' do
    expect(gift.items).to include(book)
  end

  it 'Should have a label: Gift' do
    expect(book.label).to eq(gift)
  end
end

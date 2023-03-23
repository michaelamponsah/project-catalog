require_relative '../classes/book'

RSpec.describe Book do
  book = Book.new('12-01-2007', 'London Books', 'bad')
  book.label = 'Gift'

  it 'Should create an instance of a Book' do
    expect(book).to be_an_instance_of(Book)
  end

  it 'Should have a label: Gift' do
    expect book.label.should eq('Gift')
  end

  it 'Should be archivable' do
    expect book.can_be_archived?.should be(true)
  end
end

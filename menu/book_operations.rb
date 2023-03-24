require_relative '../classes/book'
require_relative '../classes/file_processor'
require_relative '../preserve_data/label'

class BookActions
  include LabelData

  def initialize
    @books = []
    @book_file_processor = FileProcessor.new('./data_store/book.json')
  end

  def create_book
    print 'Publisher: '
    publisher = gets.chomp

    print 'Published Date [yyyy-mm-dd]: '
    published_date = gets.chomp

    print 'Cover state [good/bad]: '
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      print 'Invalid entry, cover state should be either good/bad. '
      return
    end

    add_book(published_date, publisher, cover_state)
  end

  def list_books
    data = @book_file_processor.read_from_file

    if data.empty?
      print "\nYou have no books in the list\n\n"
      return
    end

    print "\nList of books\n\n"
    data.each.with_index do |book, index|
      puts "#{index + 1} - Publisher: #{book['publisher']}
    Publish date: #{book['published_date']}
    Cover state: #{book['cover_state']}
    Label: #{book['label']}\n\n"
    end
  end

  def persist_data
    @book_file_processor.write_to_file(@books)
  end

  private

  def add_book(published_date, publisher, cover_state)
    new_book = Book.new(published_date, publisher, cover_state)
    add_label('book', new_book)

    data_hash = {
      published_date: new_book.publish_date,
      publisher: new_book.publisher,
      cover_state: new_book.cover_state,
      label: new_book.label.title
    }

    @books << data_hash
  end
end

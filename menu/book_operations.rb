require_relative '../classes/book'
require_relative '../classes/file_processor'
require_relative '../modules/label'

class BookActions
  include LabelData

  def initialize
    @books = []
    @book_file_processor = FileProcessor.new('./collections/book.json')
  end

  def create_book
    print 'Author Firstname: '
    author_fname = gets.chomp

    print 'Author Lastname: '
    author_lname = gets.chomp

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


    other_props = { author_fname: author_fname, author_lname: author_lname }
    add_book(published_date, publisher, cover_state, other_props)
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

  def add_book(published_date, publisher, cover_state, _other_props)
    new_book = Book.new(published_date, publisher, cover_state)
    add_label('book', new_book)
    @books << new_book

    data_hash = {
      published_date: new_book.publish_date,
      publisher: new_book.publisher,
      cover_state: new_book.cover_state,
      label: new_book.label.title
    }

    @book_file_processor.write_to_file(data_hash)
  end
end

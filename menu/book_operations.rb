require_relative '../classes/book'
require_relative '../classes/label'

class BookActions
  def initialize
    @books = []
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
    if (cover_state != 'good' && cover_state != 'bad')
      print 'Invalid entry, cover state should be either good/bad. '
      return
    end

    other_props = { author_fname: author_fname, author_lname: author_lname }
    add_book(published_date, publisher, cover_state, other_props)
  end

  def add_book(published_date, publisher, cover_state, other_props)
    new_book = Book.new(published_date, publisher, cover_state)

    label = Label.new('book')
    label.add_item(new_book)

    @books << new_book
  end
end

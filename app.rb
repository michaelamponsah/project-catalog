require_relative './menu/colorize'
require_relative './menu/games_operations'
require_relative './menu/book_operations'
require_relative './menu/label_operations'
require_relative './menu/music_operations'
require_relative './preserve_data/label'

class App
  include LabelData

  def initialize
    @colourizer = Colorizer.new
    @games = Games.new
    @book = BookActions.new
    @label = LabelActions.new
    @music_genre = MusicGenre.new
  end

  def app_start
    puts @colourizer.colorize_output(32, 'Welcome to our Category of Things App!')
    loop do
      display_list
      continue
    end
  end

  def display_list
    action_list = {
      '1': 'List all books',
      '2': 'List all labels',
      '3': 'List all music albums',
      '4': 'List all genres',
      '5': 'List of games',
      '6': 'List all authors',
      '7': 'Add a book',
      '8': 'Add a music album',
      '9': 'Add a game',
      '10': 'Add a genre',
      '11': 'exit'
    }

    puts "\n\e[33mPlease choose an option by entering a number:\e[0m"
    action_list.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def continue
    @colourizer.colorize_outprint(32, 'Enter option: ')
    user_option = gets.chomp

    case user_option
    when '1' then @book.list_books
    when '2' then @label.list_labels
    when '3' then @music_genre.list_music_albums
    when '4' then @music_genre.list_genres
    when '5' then @games.list_all_games
    when '6' then @games.list_all_authors
    when '7' then @book.create_book
    when '8' then @music_genre.add_music_album
    when '9' then @games.add_game
    when '10' then @music_genre.create_genre
    when '11'
      puts @colourizer.colorize_output(32, 'Thanks for using the app')
      @games.save_game_author_details
      @book.persist_data
      persist_label_data
      exit
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
end

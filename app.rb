require_relative './menu/colorize'
require_relative './menu/games_operations'
require_relative './menu/book_operations'

class App
  def initialize
    @colourizer = Colorizer.new
    @games = Games.new
    @book = BookActions.new
  end

  def app_start
    puts @colourizer.colorize_output(32, 'Welcome to my Projects catalog app')
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
      '10': 'exit'
    }

    puts "\e[33mPlease choose an option by entering a number:\e[0m"
    action_list.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def continue
    @colourizer.colorize_outprint(32, 'Enter option: ')
    user_option = gets.chomp

    case user_option
    when '7'
      @book.create_book
    when '10'
      puts @colourizer.colorize_output(32, 'Thanks for using the app')
      exit
    end
  end
end

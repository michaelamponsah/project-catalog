require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../preserve_data/game_author'

class Games
  include GameAuthorData

  def initialize
    @colourizer = Colorizer.new
    @games = read_game
    @authors = read_author
  end

  def add_game
    @colourizer.colorize_output(36, 'Enter Game details')

    @colourizer.colorize_outprint(35, 'Name: ')
    name = gets.chomp

    @colourizer.colorize_outprint(35, 'last_played_at(YYYY-MM-DD): ')
    last_played_at = gets.chomp

    @colourizer.colorize_outprint(35, 'publish_date(YYYY-MM-DD): ')
    publish_date = gets.chomp

    @colourizer.colorize_outprint(35, 'multiplayer(y/n): ')
    player = gets.chomp.downcase
    case player
    when 'y' then multiplayer = true
    when 'n' then multiplayer = false
    end

    new_game = Game.new(multiplayer, last_played_at, publish_date, name)
    @games.push(new_game)

    new_author = create_author
    new_author.add_item(new_game)
    @authors.push(new_author)

    @colourizer.colorize_output(36, 'Game Created successfully')
  end

  def create_author()
    @colourizer.colorize_output(36, 'Enter Author details')

    @colourizer.colorize_outprint(35, 'first_name: ')
    first_name = gets.chomp

    @colourizer.colorize_outprint(35, 'last_name: ')
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end

  def list_all_games
    if @games.empty?
      @colourizer.colorize_output(31, 'NO game records found!!')
    else
      @games.each_with_index do |game, index|
        print "#{index}) Game_name: #{game.name}, Multiplayer: #{game.multiplayer[0]}, "
        puts "last_played_at: #{game.last_played_at}, publish_date: #{game.publish_date}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      @colourizer.colorize_output(31, 'NO author records found!!')
    else
      @authors.each_with_index do |author, index|
        puts "#{index})  #{author.first_name} #{author.last_name}"
      end
    end
  end

  def save_game_author_details
    preserve_data(@games, @authors)
  end
end

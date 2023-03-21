require_relative '../classes/game'
require_relative '../classes/author'

class Games
    def initialize
       @colourizer = Colorizer.new
       @games = []
       @authors = [] 
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


    @games.push(Game.new(multiplayer, last_played_at, publish_date, name))

    @colourizer.colorize_output(36, 'Game Created successfully')

  end
end

require_relative './operations/app'
require_relative './operations/games'

class Start
  def initialize
    @app = App.new
    @games = Games.new
  end

  def app_start
    puts @app.colorize_output(32, 'Welcome to my Projects catalog app')
    loop do
      display_list
      continue
    end
  end

  def display_list
    action_list = {
      '1': 'show that app is working',
      '2': 'my',
      '3': 'list-author',
      '7': 'exit'
    }

    puts "\e[33mPlease choose an option by entering a number:\e[0m"
    action_list.each do |index, command|
      puts "#{index} - #{command}"
    end
  end

  def continue
    @app.colorize_outprint(32, 'Enter option: ')
    user_option = gets.chomp

    case user_option
    when '1' then @app.app_work
    when '7'
      puts @app.colorize_output(32, 'Thanks for using the app')
      exit
    end
  end
end

require 'json'
require_relative '../classes/game'
require_relative '../classes/author'

module GameAuthorData
  # rubocop:disable Style/MutableConstant
  GAME_FILE_NAME = './data_store/game.json'
  AUTHOR_FILE_NAME = './data_store/author.json'
  # rubocop:enable Style/MutableConstant

  def preserve_data(games, authors)
    games_arr = []
    authors_arr = []

    games.each do |game|
      games_arr << {
        name: game.name,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer[0]
      }
    end

    authors.each do |author|
      authors_arr << {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end

    File.write(GAME_FILE_NAME, JSON.generate(games_arr))
    File.write(AUTHOR_FILE_NAME, JSON.generate(authors_arr))
  end

  def read_game
    new_game = []
    File.new(GAME_FILE_NAME.to_s, 'w') unless File.exist?(GAME_FILE_NAME)
    file = File.read(GAME_FILE_NAME)
    data = file.empty? ? [] : JSON.parse(file)

    data.each do |el|
      new_game << Game.new(el['multiplayer'], el['last_played_at'], el['publish_date'], el['name'])
    end
    new_game
  end

  def read_author
    new_author = []
    File.new(AUTHOR_FILE_NAME.to_s, 'w') unless File.exist?(AUTHOR_FILE_NAME)
    file = File.read(AUTHOR_FILE_NAME)
    data = file.empty? ? [] : JSON.parse(file)

    data.each do |el|
      new_author << Author.new(el['first_name'], el['last_name'])
    end
    new_author
  end
end

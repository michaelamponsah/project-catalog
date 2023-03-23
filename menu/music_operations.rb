require_relative './classes/item'
require_relative './classes/genre'
require_relative './classes/music_album'
require_relative './preserve_data/preserve_albums'
require_relative './preserve_data/preserve_genres'

class MusicGenre
  attr_accessor :genres, :music_albums
    
  include PreserveAlbumsData
  include PreserveGenresData

  def initialize
    @colourizer = Colorizer.new
    @music_albums = load_albums
    @genres = load_genres
  end

  def list_music_albums
    if @music_albums.empty?
        @colourizer.colorize_output(31, 'There are no music albums to display')
    else
      puts 'Existing music albums:'
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1} - [Album] Name: #{album.name} | Publish Date: #{album.publish_date} | On spotify: #{album.on_spotify} "
      end
    end
  end
  def list_genres
    if @genres.empty?
        @colourizer.colorize_output(31, 'There are no genres to display')
    else
      puts 'Existing genres:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1} - [Genre] Name: #{genre.name}"
      end
    end
  end

  def add_music_album
    @colourizer.colorize_output(36, 'Enter Music album details')
    
    @colourizer.colorize_outprint(35, 'Album name: ')
    name = gets.chomp

    @colourizer.colorize_outprint(35, 'Enter date of publish (yyyy-mm-dd): ')
    publish_date = gets.chomp.to_s

    @colourizer.colorize_outprint(35, 'Is it available on Spotify? Y/N: ')
    on_spotify = gets.chomp.downcase

    case on_spotify
    when 'y'

      @music_albums << MusicAlbum.new(name, publish_date, on_spotify: true)
    when 'n'

      @music_albums << MusicAlbum.new(name, publish_date, on_spotify: false)
    else
      puts 'Invalid entry. Enter Y/N.'
    end

    @colourizer.colorize_output(36, 'Music album created successfully')
    store_albums(@music_albums)
  end

  def create_genre
    @colourizer.colorize_output(36, 'Enter genre details')
    
    @colourizer.colorize_outprint(35, 'Enter genre name: ')
    genre = gets.chomp

    @genres << Genre.new(genre)

    @colourizer.colorize_output(36, 'New genre has been successfully created')
    store_genres(@genres)
  end

end
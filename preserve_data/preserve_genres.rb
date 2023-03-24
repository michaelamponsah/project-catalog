require 'json'

module PreserveGenresData
  $genre_data = []
  # rubocop:disable Style/MutableConstant
  GENRE_FILE_PATH = './data_store/genres.json'
  # rubocop:enable Style/MutableConstant

  def store_genres(genres)
    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      $genre_data = File.exist?(GENRE_FILE_PATH) ? JSON.parse(File.read(GENRE_FILE_PATH)) : []
    rescue JSON::ParserError, Errno::ENOENT
      $genre_data = []
    end

    genres.each do |genre|
      next if $genre_data.any? do |existing_genre|
        existing_genre['name'] == genre.name
      end

      $genre_data << { name: genre.name }
    end
  end

  def persist_genre_data
    return if $genre_data.empty?

    File.write(GENRE_FILE_PATH, JSON.pretty_generate($genre_data))
  end

  def load_genres
    return [] unless File.exist?(GENRE_FILE_PATH)

    # return [] ifGENRE_FILE_PATH.nil? || !File.exist?(GENRE_FILE_PATH)

    if File.empty?(GENRE_FILE_PATH)
      []
    else
      JSON.parse(File.read(GENRE_FILE_PATH)).map do |genre|
        Genre.new(genre['name'])
      end
    end
  end
end

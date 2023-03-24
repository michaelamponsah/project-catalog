require 'json'

module PreserveGenresData
  @@genre_data = []
  @@file = './data_store/genres.json'

  def store_genres(genres)
    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      @@genre_data = File.exist?(@@file) ? JSON.parse(File.read(@@file)) : []
    rescue JSON::ParserError, Errno::ENOENT
      @@genre_data = []
    end

    genres.each do |genre|
      next if @@genre_data.any? do |existing_genre|
        existing_genre['name'] == genre.name
      end

      @@genre_data << { name: genre.name }
    end
  end
  
  def persist_genre_data
    return if @@genre_data.empty?
    File.write(@@file, JSON.pretty_generate(@@genre_data))
  end

  def load_genres
    return [] unless File.exist?(@@file)

    if File.empty?(@@file)
      []
    else
      JSON.parse(File.read(@@file)).map do |genre|
        Genre.new(genre['name'])
      end
    end
  end
end

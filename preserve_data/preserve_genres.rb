require 'json'

module PreserveGenresData
  def store_genres(genres)
    file = './data_store/genres.json'

    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      data = File.exist?(file) ? JSON.parse(File.read(file)) : []
    rescue JSON::ParserError, Errno::ENOENT
      data = []
    end

    genres.each do |genre|
      next if data.any? do |existing_genre|
        existing_genre['name'] == genre.name
      end

      data << { name: genre.name }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def load_genres
    file = './data_store/genres.json'
    return [] unless File.exist?(file)

    if File.empty?(file)
      []
    else
      JSON.parse(File.read(file)).map do |genre|
        Genre.new(genre['name'])
      end
    end
  end
end
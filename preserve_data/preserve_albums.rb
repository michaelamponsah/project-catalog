require 'json'

module PreserveAlbumsData
  # rubocop:disable Metrics
  def store_albums(albums)
    file = './data_store/albums.json'

    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      data = File.exist?(file) ? JSON.parse(File.read(file)) : []
    rescue JSON::ParserError, Errno::ENOENT
      data = []
    end

    albums.each do |album|
      next if data.any? do |existing_album|
        existing_album['name'] == album.name && existing_album['publish_date'] == album.publish_date
      end || data.any? { |existing_album| existing_album['name'] == album.name }

      data << { name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end

    File.write(file, JSON.pretty_generate(data))
  end

  # rubocop:enable Metrics

  def load_albums
    file = './data_store/albums.json'
    return [] unless File.exist?(file)

    if File.empty?(file)
      []
    else
      JSON.parse(File.read(file)).map do |album|
        MusicAlbum.new(album['name'], album['publish_date'], on_spotify: album['on_spotify'])
      end
    end
  end
end

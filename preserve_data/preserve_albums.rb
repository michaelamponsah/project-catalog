require 'json'

module PreserveAlbumsData
  # rubocop:disable Metrics
  @@file = './data_store/albums.json'
  @@album_data = []

  def store_albums(albums)
    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      @@album_data = File.exist?(@@file) ? JSON.parse(File.read(@@file)) : []
    rescue JSON::ParserError, Errno::ENOENT
      @@album_data = []
    end

    albums.each do |album|
      next if  @@album_data.any? do |existing_album|
        existing_album['name'] == album.name && existing_album['publish_date'] == album.publish_date
      end ||  @@album_data.any? { |existing_album| existing_album['name'] == album.name }

      @@album_data << { name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
  end

  # rubocop:enable Metrics

  def persist_album_data
    return if @@album_data.empty?
    File.write(@@file, JSON.pretty_generate(@@album_data))
  end

  def load_albums
    return [] unless File.exist?(@@file)

    if File.empty?(@@file)
      []
    else
      JSON.parse(File.read(@@file)).map do |album|
        MusicAlbum.new(album['name'], album['publish_date'], on_spotify: album['on_spotify'])
      end
    end
  end
end

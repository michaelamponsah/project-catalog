require 'json'

module PreserveAlbumsData
  # rubocop:disable Metrics
  # rubocop:disable Style/MutableConstant
  ALBUM_FILE_PATH = './data_store/albums.json'
  # rubocop:enable Style/MutableConstant

  $album_data = []

  def store_albums(albums)
    $album_data ||= []

    # Read the contents of the file and handle empty file / invalid JSON cases
    begin
      $album_data = File.exist?(ALBUM_FILE_PATH) ? JSON.parse(File.read(ALBUM_FILE_PATH)) : []
    rescue JSON::ParserError, Errno::ENOENT
      $album_data = []
    end

    albums.each do |album|
      next if $album_data.any? do |existing_album|
        existing_album['name'] == album.name && existing_album['publish_date'] == album.publish_date
      end || $album_data.any? { |existing_album| existing_album['name'] == album.name }

      $album_data << { name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
  end

  # rubocop:enable Metrics

  def persist_album_data
    return if $album_data.empty?

    File.write(ALBUM_FILE_PATH, JSON.pretty_generate($album_data))
  end

  def load_albums
    if !File.exist?(ALBUM_FILE_PATH) || File.size?(ALBUM_FILE_PATH).nil?
      []
    else
      begin
        parsed_data = JSON.parse(File.read(ALBUM_FILE_PATH))
        if parsed_data.nil?
          []
        else
          parsed_data.map do |album|
            MusicAlbum.new(album['name'], album['publish_date'], on_spotify: album['on_spotify'])
          end
        end
      rescue JSON::ParserError
        []
      end
    end
  end
end

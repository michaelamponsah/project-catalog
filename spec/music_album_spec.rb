require './classes/music_album'

describe MusicAlbum do
  let(:publish_date) { Date.new(2023, 0o4, 18) }

  describe '#initialize' do
    it 'sets the name and on_spotify attributes' do
      album = MusicAlbum.new('Test Album', publish_date)
      expect(album.name).to eq('Test Album')
      expect(album.on_spotify).to eq true
    end

    it 'sets the publish_date attribute' do
      album = MusicAlbum.new('Test Album', publish_date)
      expect(album.publish_date).to eq(publish_date)
    end
  end

  describe '#can_be_archived?' do
    it 'returns false if the album is not on Spotify' do
      album = MusicAlbum.new('Test Album', publish_date, on_spotify: false)
      expect(album.can_be_archived?).to eq false
    end

    it 'returns the value of the superclass method if the album is on Spotify' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
      album = MusicAlbum.new('Test Album', publish_date)
      expect(album.can_be_archived?).to eq true
    end
  end
end
require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :publish_date, :archived

  def initialize(name, publish_date, on_spotify: true, archived: false)
    super(publish_date, archived: archived)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
end
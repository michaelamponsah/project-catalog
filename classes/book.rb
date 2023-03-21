require_relative './item'

class Book < Item
  def initialize(publish_date, publiser, cover_state, archived)
    super(publish_date, archived)

    @publisher = publiser
    @cover_state = cover_state
  end
end

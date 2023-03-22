require_relative './item'

class Book < Item
  def initialize(publish_date, publiser, cover_state, archived: false)
    super(publish_date, archived)

    @publisher = publiser
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super.can_be_archived? || cover_state == 'bad'

    false
  end
end

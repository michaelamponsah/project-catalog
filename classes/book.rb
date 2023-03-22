require_relative './item'

class Book < Item
  attr_reader :genre, :author, :label

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if (Item.instance_method(:can_be_archived?).bind(self) == true) || @cover_state == 'bad'
      return true
    end
    false
  end
end

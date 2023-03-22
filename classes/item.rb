require 'date'

class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

end

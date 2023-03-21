require 'date'

class Item
  attr_writer :genre, :author, :source, :label

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

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end

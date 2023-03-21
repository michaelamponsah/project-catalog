require 'date'

class Item
  attr_writer :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10 ? true : false 
  end

end
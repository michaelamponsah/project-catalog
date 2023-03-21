require 'date'

class Item
  attr_writer :genre, :author, :source, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre.name
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author.first_name
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label=(label)
    @label = label.title
    label.items.push(self) unless label.items.include(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end

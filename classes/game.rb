require 'date'

class Game < Item
    attr_accessor :multiplayer, :last_played_at, :publish_date, :author, :archived
    
    def initialize(multiplayer, last_played_at, publish_date, archived: false)
        @multiplayer = multiplayer,
        @last_played_at = Date.parse(last_played_at)
        super(publish_date, archived)
    end

    def can_be_archived?
        super && (Date.today.year - @last_played_at.year) > 2
    end
end
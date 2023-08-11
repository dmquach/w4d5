require_relative 'card'

class Deck

    attr_reader :deck
    def initialize
        @deck = []
        populate
    end

    def populate
        suit = ['Spade', 'Heart','Club','Diamond']
        face = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J' ,'Q' ,'K', 'A' ]
        face.each do |ele1|
            suit.each do |ele2|
                @deck << Card.new(ele2, ele1)
            end
        end
        return true
    end
end
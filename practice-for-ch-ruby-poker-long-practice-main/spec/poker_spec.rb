require "game"
require "card"
require "deck"
require "hand"
require "player"


describe Card do
    c = Card.new('K', 'Spade')
    describe "#initialize" do
        it 'Should have a suit' do
        expect(c.suit).to eq('Spade')
        end
        it 'Should have a face' do 
            expect(c.face).to eq('K')
        end
    end
end

describe Deck do 
    d = Deck.new
    describe '#initialize' do
        it 'should have a dec size of 52' do 
            expect(d.deck.size).to eq(52)
        end
    end

    describe '#populate' do 
        it 'should fill the deck' do 
            expect(d.populate).to eq(true)
        end
    end
end


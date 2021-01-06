
require 'set'

class Card
  include Comparable
  attr_reader :rank, :suit

  CARD_RANKINGS = Set.new([2, 3, 4, 5, 6, 7, 8, 9, 10, 
                          "Jack", "Queen", "King", "Ace"]).freeze
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    CARD_RANKINGS.find_index(self.rank) <=> 
    CARD_RANKINGS.find_index(other_card.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = create_deck
  end

  def create_deck
    RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }.shuffle
  end

  def draw
    @cards = create_deck if @cards.empty?
    @cards.pop
  end
end

deck = Deck.new
p deck
drawn = []
52.times { drawn << deck.draw }
p drawn
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2
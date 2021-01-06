# Update this class so you can use it to determine the lowest ranking and 
# highest ranking cards in an Array of Card objects:
require 'set'

class Card
  include Comparable
  attr_reader :rank, :suit

  CARD_RANKINGS = Set.new([2, 3, 4, 5, 6, 7, 8, 9, 10, 
                          "Jack", "Queen", "King", "Ace"]).freeze

  SUIT_RANKINGS = Set.new(["Diamonds", "Clubs", "Hearts", "Spades"]).freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    result = CARD_RANKINGS.find_index(self.rank) <=> 
             CARD_RANKINGS.find_index(other_card.rank)
    if result == 0
      result = SUIT_RANKINGS.find_index(self.suit) <=> 
      SUIT_RANKINGS.find_index(other_card.suit)
    end
  end

  # def ==(other_card)
  #   suit == other_card.suit && rank == other_card.rank
  # end

  def to_s
    "#{rank} of #{suit}"
  end
end

# Examples:

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds')]
puts cards
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8


cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'), Card.new(8, 'Spades')]

puts cards.max
puts cards.min
        #  

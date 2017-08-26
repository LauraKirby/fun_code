# Deck of Cards: Design the data structures for a generic deck of cards.
# Explain how you would subclass the data structures.

# Suit
  # instance variables
    # pip
    # rank
  # instance methods
    # to_s

# Card
  # instance variables
    # suit: a Card has one Suit
  # instance methods
    # to_s

# Deck
  # has 52 Cards
  # instance method
    # type (show different versions eg: standard French, for children)

# Currently, Card has the attribute "type". Since this restates information
# provided by Deck, I believe that Card should inherit from Deck. However,
# this would mean that a Card could not be created without a Deck. This
# is how playing cards are usually purchased, so I guess this is ok.

STANDARD_PIPS = [ :club, :diamond, :heart, :spade ]
STANDARD_RANKS  = [ :two, :three, :four, :five, :six, :seven, :eight,
                    :nine, :ten, :jack, :queen, :king, :ace ]

class Suit
  attr_accessor :pip, :rank

  def initialize(pip, rank)
    @pip = pip
    @rank = rank
  end

  def to_s
    "#{self.pip} of #{self.rank}"
  end
end

class Card
  attr_accessor :suit, :type

  def initialize(type, pip, rank)
    @suit = Suit.new(pip, rank)
    @type = type
  end

  def to_s
    "#{self.type}, #{self.suit.pip} of #{self.suit.rank}"
  end
end

class Deck
  attr_accessor :cards, :type, :dealt_index
  @@types = [:standard]

  def initialize(create_type)
    if @@types.include? create_type
      @type = create_type
      @cards = self.send(create_type)
    else
      puts "Deck type must be one of #{@@types}"
    end
    @dealt_index = 0 # marks the first undealt card
  end

  def cards_for_suit(rank)
    self.cards.lazy.select { |card| card.suit.rank == rank }.first(13)
  end

  def self.types
    @@types
  end

  def standard
    STANDARD_RANKS.flat_map {|rank| STANDARD_PIPS.map {|pip| Card.new(:standard, rank, pip)}}
  end
end

# Create a Suit
# suit = Suit.new(STANDARD_PIPS[0], STANDARD_RANKS[0])

# Create a Card
# card = Card.new(:standard, STANDARD_PIPS[0], STANDARD_RANKS[0])

# Create a "standard" Deck of Cards
deck = Deck.new(:standard)
puts deck.cards_for_suit(:club)
puts "first card in deck: #{deck.cards[0].to_s}"
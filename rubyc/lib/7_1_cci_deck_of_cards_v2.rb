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
    # suit: has one Suit
  # instance methods
    # to_s
    # is_facecard?

# Deck
  # has 52 Cards
  # type (show different versions eg: standard French, for children)

STANDARD_PIPS = [ :club, :diamond, :heart, :spade ]
STANDARD_RANKS  = [ :two, :three, :four, :five, :six, :seven, :eight,
                    :nine, :ten, :jack, :queen, :king, :ace ]
KID_PIPS = [ :apple, :ball, :cat ]
KID_RANKS  = [ :A, :B, :C]

class Suit
  attr_accessor :pip, :rank

  def initialize(pip, rank)
    @pip = pip
    @rank = rank
  end

  def to_s
    puts "Suit: #{self.pip} of #{self.rank}"
  end
end

class Card
  attr_accessor :suit, :type
  attr_writer :pip, :rank

  def initialize(type, pip, rank)
    @suit = Suit.new(pip, rank)
    @type = type
  end

  def self.suits_for_type(card_type)
    # result = []
    # ObjectSpace.each_object(self) do |crd_obj|
    #   if crd_obj.type == card_type
    #     result.push(crd_obj.suit.to_s)
    #   end
    # end
    # result
    # should probably create a hash here -- if not, will run into issues after more
    # than one deck is created
    result = []
    ObjectSpace.each_object(self) { |obj| result.push(obj.suit.to_s) if obj.type == card_type }
    puts result
  end

  def to_s
    puts "Card: #{self.type}, Suit: #{self.suit.pip} of #{self.suit.rank}"
  end
end

class Deck
  attr_accessor :cards, :type, :dealt_index
  @@types = [:standard, :kid]

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

  def kid
    KID_RANKS.each_with_index {|rank, i| Card.new(:kid, rank, KID_PIPS[i])}
  end

  def to_s
    puts @type
    print "Deck: Type: #{@type}, Card count: #{@cards.length}, Suits: #{Card.suits_for_type(@type)}"
  end
end

# Create a Suit
# suit = Suit.new(STANDARD_PIPS[0], STANDARD_RANKS[0])

# Create a Card
# card = Card.new(:standard, STANDARD_PIPS[0], STANDARD_RANKS[0])

# Create a "kid" Deck of Cards
deck_k = Deck.new(:kid)
# deck_k.to_s

# Card.suits_for_type(:kid)
# puts deck_k.cards[0].suit
# puts deck_k.cards_for_suit(:apple)
# Create a "standard" Deck of Cards
deck = Deck.new(:standard)
puts deck.cards[0].suit
# deck.to_s

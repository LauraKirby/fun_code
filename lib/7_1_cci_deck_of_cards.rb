# Deck of Cards: Design the data structures for a generic deck of cards.
# Explain how you would subclass the data structures to implement blackjack.

# Deck
# 50 cards

# Card
# 4 Suits (diamonds, hearts, spades)
# black or red

# Deck has many Cards
# Card belongs to one Deck

# Blackjack
#

# Participant
  # - evaluate cards
  # - ask for 3rd card

# Dealer
  # - deal 2 cards to each Participant

class Card
  attr_accessor :suit, :face, :value, :type

  @description = "height: 6' x 7' "

  def initialize(suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end

  def self.description
    @description
  end
end

class Deck
  attr_accessor :cards

  @types = [:french, :alphabet]

  def initialize(type)
    @type = type
    @cards = add_cards() # an array of all cards, dealt or not
    @dealt_index = @cards.count - 1 # marks the first undealt card, assuming last put in stack
  end

  def self.types
    @types
  end

  def add_cards
    if @type == :french
      faces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king"]
      suits = [:hearts, :spades, :diamonds, :clubs]
      cards = []
      return create_cards(faces, suits, cards)
    elsif @type == :alphabet
      faces = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
      suits = [:red, :orange, :yellow, :green, :blue, :purle]
      cards = []
      return create_cards(faces, suits, cards)
    else
      print "Deck type must be #{Deck.types}"
      return []
    end
  end

  def create_cards(faces, suits, cards=[])
    suits.count.times do |i|
      suit = suits[i]
      faces.count.times do |j|
        card = Card.new(suit, faces[j], j)
        card.type = @type
        cards.push(card)
      end
    end
    cards
  end

  # Fisher-Yates shuffle, in place.
  def shuffle_cards
    n = self.cards.count
    while n > 0
      i = rand(n -= 1)
      self.cards[i] = self.cards[n]
      self.cards[n] = self.cards[i]
    end
    self
  end

  def deal_hand(number)
    hand = []
    lowest = @dealt_index - number
    puts lowest..@dealt_index
    (lowest..@dealt_index).each_with_index do |i|
      puts self.cards[i].face
      # print self.cards[i]
      hand.push(self.cards[i])
    end
    # hand.each {|c| puts c.value}
    @dealt_index = lowest

    hand
  end

  def print_cards
    cards.each do |c|
      puts "#{c.type}, #{c.face}, #{c.suit}, #{c.value}"
    end
  end
end

class Player
  def initialize(player_name="",hand=0)
    @player_name = player_name
    @hand = hand
  end
end

# print Deck.types
deck = Deck.new(:french)
alphabet = Deck.new(:alphabet)

deck = deck.shuffle_cards
# deck.print_cards
deck.deal_hand(5)
# Card.suits.each do |s|
#   puts s
# end

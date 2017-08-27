# Deck of Cards: Design the data structures for a generic deck of cards.
# Explain how you would subclass the data structures to implement blackjack.

# Suit
# club, diamond, heart, spade, A, B, C, etc.
# color
# value: 0,1,2,3, Apple:, :Ball, :Cat
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
class Suit
  attr_accessor :name, :value
  @@values = { club: 0, diamond: 1, heart: 2, spade: 3,
                        animal: 01, fruit: 02, toy: 03 }

  def initialize(name)
    @name = name
    @value = @@values[@name]
  end

  def self.suits
    @@values.keys
  end

  def self.standard_suits
    [:club, :diamond, :heart, :spade]
  end

  def self.kid_suits
    [:animal, :fruit, :toy]
  end

  def self.get_value_from_suit(key)
    @@values[key]
  end

  def self.get_suits_from_value(val)
    suits_val = @@values.select {|k,v| v == val}
    suits_val.keys
  end
end

class Card
  attr_accessor :suit, :face, :value, :type
  @@faces_values = { two: 2, three: 3, four: 4, five: 5, six: 6,
                     seven: 7, eight: 8, nine: 9, ten: 10, jack: 11,
                     queen: 12, king: 13, ace: 14, A: :apple, B: :ball,
                     C: :cat }

  def initialize(suit, face)
    @suit = Suit.new(suit)
    @face = face
    @value = @@faces_values[face]
  end

  def self.faces
    @@faces_values.keys
  end

  def self.standard_faces
    [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  end

  def self.kid_faces
    [:A, :B, :C]
  end

  def self.get_value_from_face(face)
    @@faces_values[face]
  end

  def suit_name
    self.suit.name
  end
end

class Deck
  attr_accessor :cards, :type, :dealt_index
  @@types = [:standard, :kid]

  def initialize(type)
    @type = type
    @cards = add_cards() # an array of all cards, dealt or not
    @dealt_index = 0 # marks the first undealt card
  end

  def self.types
    @types
  end

  def add_cards
    if @type == :standard
      faces = Suit.standard_suits
      suits = Card.standard_faces
      return create_cards(faces, suits)
    elsif @type == :kid
      faces = Suit.kid_suits
      suits = Suit.kid_faces
      return create_cards(faces, suits)
    else
      print "Deck type must be #{Deck.types}"
      return []
    end
  end

  def create_cards(faces, suits, cards=[])
    suits.length.times do |i|
      suit = suits[i]
      faces.length.times do |j|
        card = Card.new(suit, faces[j])
        card.type = @type
        cards.push(card)
      end
    end
    cards
  end

  # Fisher-Yates shuffle, in place. Time and space: O(n)
  def shuffle_cards
    n = self.cards.length - 1
    while n > 0
      i = rand(n -= 1 )
      temp = self.cards[i]
      self.cards[i] = self.cards[n]
      self.cards[n] = temp
      # can be written more elegantly like:
      # self.cards[i], self.cards[n] = self.cards[n], self.cards[i]
    end
    self.cards.each do |c|
      puts c.face
    end
    self
  end

  def deal_hand(num)
    number = num - 1
    hand = []
    higher = @dealt_index + number
    (@dealt_index..higher).each_with_index do |i|
      hand.push(self.cards[i])
    end
    @dealt_index = num + @dealt_index
    hand
  end

  def print_cards
    cards.each do |c|
      puts "#{c.type}, #{c.face}, #{c.suit}, #{c.value}"
    end
  end

  def cards_remaining
    result = cards.length - @dealt_index
    puts "cards remaining: #{result}"
    result
  end
end

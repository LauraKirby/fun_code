require '_spec_helper'


describe "Suit" do
  it "has a 'suit' property" do
    suit = Suit.new(:club)
    expect(suit.name).to eq(:club)
  end

  it "has a 'value' property" do
    suit = Suit.new(:club)
    expect(suit.value).to eq(0)
  end

  describe "#self.suits" do
    it "returns all available suits" do
      expect(Suit.suits).to eq [:club, :diamond, :heart, :spade, :animal, :fruit, :toy]
    end
  end

  describe "#self.get_value_from_suit" do
    it "returns the value for the provided suit" do
      value = Suit.get_value_from_suit(:club)
      expect(value).to eq(0)
    end
  end

  describe "#self.get_suits_from_value" do
    it "returns a suit for provided value" do
      suits = Suit.get_suits_from_value(1)
      expect(suits).to match_array([:diamond, :animal])
    end
  end
end

describe "Card" do
  it "has a 'suit' property" do
    card = Card.new(:spade, :ace)
    expect(card.suit.name).to eq(:spade)
  end

  it "has a 'face' property" do
    card = Card.new(:spade, :ace)
    expect(card.face).to eq(:ace)
  end

  it "has a 'value' property" do
    card = Card.new(:spade, :ace)
    expect(card.value).to eq(14)
  end

  describe "#self.faces" do
    it "returns an array of all face options" do
      expect(Card.faces).to match_array([ :two, :three, :four, :five, :six,
                                          :seven, :eight, :nine, :ten, :jack, :queen,
                                          :king, :ace, :A, :B, :C])
    end
  end

  describe "#self.get_value_from_face" do
    it "returns the 'value' for a 'face' " do
      expect(Card.get_value_from_face(:jack)).to eq(11)
    end
  end

  describe "#suit_name" do
    it "returns the name of the suit for a card" do
      card = Card.new(:spade, :ace)
      expect(card.suit_name).to eq(:spade)
    end
  end
end

describe "Deck" do
  it "has a 'cards' property" do
    deck = Deck.new(:standard)
    expect(deck.cards.length).to eq(52)
  end

  it "has a 'dealt_index' property" do
    deck = Deck.new(:standard)
    expect(deck.dealt_index).to eq(0)
  end

  it "has a 'type' property" do
    deck = Deck.new(:standard)
    expect(deck.type).to eq(:standard)
  end

  describe "#shuffle_cards" do
  end

  describe "#deal_hand" do
    it "updates the index when a hand is dealt" do
      deck = Deck.new(:standard)
      deck.deal_hand(5)
      new_idex = deck.dealt_index
      expect(new_idex).to eq(5)
    end
  end

  describe "#add_cards" do
  end
end
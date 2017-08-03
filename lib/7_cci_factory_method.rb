# chapter 7: object-oriented design
# cracking the coding interview

# create a Factory Method
# offers an interface for creating an instance of a class,
# with its subclasses deciding which class to instantiate.


class CardGame
  attr_accessor :type, :cards, :game

  def initialize(type)
    @type = type
    @cards = 52
    @game = createCardGame()
  end

  def createCardGame
    if type == "poker"
      return PokerGame.new()
    elsif type == "blackjack"
      return BlackJackGame.new()
    end

    return "That card game type does't exist yet."
  end
end

class GameType
  attr_accessor :description

  def initialize
    @description = "A specific game with a set of rules."
  end

end

class PokerGame < GameType
  attr_accessor :cards_to_deal, :game_name

  def initialize
    @cards_to_deal = 5
    @game_name = "Poker"
  end
end

class BlackJackGame < GameType
  attr_accessor :cards, :game_name

  def initialize
    @cards_to_deal = 2
    @game_name = "BlackJack"
  end
end



# create instance of CardGame
card_game = CardGame.new("poker")
puts card_game.game.cards_to_deal

puts ObjectSpace.each_object(PokerGame){}
puts ObjectSpace.each_object(CardGame){}
puts ObjectSpace.each_object(GameType){}

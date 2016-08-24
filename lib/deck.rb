require_relative 'card'

class Deck

  attr_reader :cards
  def initialize
    @cards = []
    populate
  end

  def shuffle
    @cards = @cards.dup.shuffle
  end

  def draw
    new_card = @cards.pop
  end

  private

  def populate
    Card.values.each do |value|
      Card.suits.each do |suit|
        cards << Card.new(value, suit)
      end
    end
  end

end

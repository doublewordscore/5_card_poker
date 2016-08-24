class Hand

  def initialize
    @cards = []
  end

  def add_card(card)
    raise "Error!" if @cards.length == 5
    @cards << card
  end

  def strength
    return "royal flush" if royal_flush?
    return "flush" if flush?
  end

  private
  def royal_flush?
    return false unless same_suit?
    return false unless @cards.map(&:value).sort == ["A", "J", "K", "Q", "T"]
    true
  end

  def flush?
    same_suit?
  end

  def straight?
    straights.include?(@cards.sort)
  end

  def same_suit?
    suit = @cards[0].suit
    return false unless @cards.all? { |card| card.suit == suit }
    true
  end

  def straights
    values = Card.values
    (0..values.length-5).map do |first|
        values[first..(first + 4)]
    end
  end
end

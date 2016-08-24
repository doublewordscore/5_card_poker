class Card
  attr_reader :value, :suit

    VALUE = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "J" => 10,
      "Q" => 10,
      "K" => 10,
      "A" => 1
    }

  def self.suits
    [:hearts, :spades, :diamonds, :clubs]
  end

  def self.values
    (2..9).to_a.map(&:to_s) + ["A", "K", "Q", "J", "T"]
  end

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

end

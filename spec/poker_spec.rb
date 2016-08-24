require 'card'
require 'deck'
require 'hand'
require 'byebug'

describe Card do
  subject(:card)  { Card.new("8", :spades) }
  subject(:card2) { Card.new("K", :hearts) }
  # subject(:card3) { Card.new("A", :diamond) }

  describe '#value' do
    it 'returns the value of the card' do
      expect(card.value).to eq("8")
      expect(card2.value).to eq("K")
      # expect(card3.value).to eq(1)
    end
  end

  describe '#suit' do
    it 'returns the suit of the card' do
      expect(card.suit).to eq(:spades)
      expect(card2.suit).to eq(:hearts)
    end
  end



end

describe Deck do
  subject(:deck) { Deck.new }

  describe '#shuffle' do

    it 'ensures the deck is shuffled' do
      preshuffle = deck.cards
      deck.shuffle
      postshuffle = deck.cards
      expect(preshuffle).not_to eq(postshuffle)
      expect(preshuffle).to be_an_instance_of(Array)
      expect(postshuffle).to be_an_instance_of(Array)
    end
  end

  describe '#draw' do

    it 'removes a card from the deck and returns it' do
        predraw = deck.cards.dup
        card_drawn = deck.draw
        postdraw = deck.cards.dup
        expect(postdraw.length).to eq(predraw.length - 1)
        expect(card_drawn).to be_an_instance_of(Card)
    end

  end
end

describe Hand do
  subject(:hand) { Hand.new }
  let(:card1) { double(suit: :hearts, value: "A") }
  let(:card2) { double(suit: :hearts, value: "K") }
  let(:card3) { double(suit: :hearts, value: "Q") }
  let(:card4) { double(suit: :hearts, value: "J") }
  let(:card5) { double(suit: :hearts, value: "T") }
  let(:card6) { double(suit: :hearts, value: "2") }

  describe '#strength' do
    it 'checks for royal flush' do
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      expect(hand.strength).to eq("royal flush")
    end

    it 'checks for flush' do
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card6)
      expect(hand.strength).to eq("flush")
    end
  end

  describe '#cards' do
    it 'returns the cards in hand' do
      expect(card1.suit).to eq(:hearts)
    end
  end

  describe '#add_card' do
    it 'adds a card to the hand' do

    end

    it 'raises error if the player currently has 5 cards' do

    end
  end

end
#
# describe Game do
#   let(:hand)     { double("hand") }
#   let(:player1)  { double("player") }
#   let(:player2)  { double("player") }
#   let(:player3)  { double("player") }
#   subject(:game) { Game.new }
#
#   describe '#deal' do
#
#     it 'ensures 5 cards are dealt to each player' do
#
#     end
#   end
#
#   describe '#discard' do
#
#     it 'only allows for 3 discards' do
#
#     end
#
#   end
#
#   describe '#bet' do
#
#     it 'does not allow players to bet more than they have' do
#
#     end
#
#   end
#
#   describe '#winning_hand' do
#
#     it 'selects winning hand' do
#
#     end
#
#   end
#
#
# end

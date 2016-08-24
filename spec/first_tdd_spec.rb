require 'first_tdd'

describe Array do
  subject(:arr) { [1, 2, 1, 3, 3] }

  describe '#my_uniq' do

    it 'returns array with unique elements' do
      expect(arr.my_uniq).to contain_exactly(1, 2, 3)
    end

    it 'does not modify original array' do
      arr.my_uniq
      expect(arr).to eq([1, 2, 1, 3, 3])
    end

    it 'does not change the order of the unique elements' do
      expect(arr.my_uniq).to eq([1,2,3])
      expect(arr.my_uniq).not_to eq([2,1,3])
    end

  end

  describe '#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it 'does not return spurious zeroes' do
      expect(arr.two_sum).not_to include([1, 1])
    end

    it 'finds all pairs of positions where the elements sum to zero' do
      expect(arr.two_sum).to contain_exactly([0, 4], [2, 3])
    end

    it 'ensures that the resulting array is in order' do
      expect(arr.two_sum).to_not eq([[2, 3], [0, 4]])
    end

    it 'ensures that smaller first elements come first' do
      expect(arr.two_sum[0][0]).to be < (arr.two_sum[0][1])
    end
  end

  describe '#my_transpose' do
    subject(:arr) { [[0,1,2], [3,4,5], [6,7,8]] }

    it 'flips the dimensions of a 2d array' do
      old_dim = [arr.length, arr[0].length]
      new_arr = arr.my_transpose
      new_dim = [new_arr.length, new_arr[0].length]
      expect(new_dim).to eq([old_dim[1], old_dim[0]])
    end

    it 'does not modify the original array' do
      arr.my_transpose
      expect(arr).to eq([[0,1,2], [3,4,5], [6,7,8]])
    end

    it 'transposes the elements of a 2d array' do
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end
end

describe '#stock_picker' do
  subject(:arr) { [100, 100, 200, 1000, 300] }
  let(:ans) { stock_picker(arr) }

  it 'checks that the sell date is after the buy date' do
    expect(ans[0]).to be < ans[1]
  end

  it 'returns an array of days that produce the maximum profit' do
    expect(ans).to eq([1, 3]).or eq([0, 3])
  end

  it 'returns the fewest required days for maximum profit' do
    expect(ans).to eq([1,3])
  end

end

describe Game do
  subject(:game) { Game.new }

  describe '#move' do
    it 'takes a from_pos and to_pos parameters' do
      expect(game).to respond_to(:move).with(2).arguments
    end

    it 'does not allow user to place bigger disc onto smaller disc' do
      game.move(0,1)
      expect { game.move(0,1) }.to raise_error()

    end

    it 'moves one disc at a time' do
      game.move(0,1)
      expect(game.towers).to eq([ [2,3], [1], [] ])
    end

    it 'cannot move from empty array' do
      expect { game.move(1,0) }.to raise_error()
    end

  end

  describe '#won?' do
    context 'when won?' do
      let(:winning_board) { Game.new([ [], [1,2,3], [] ]) }
      it 'returns true if game is won' do
        expect(winning_board.won?).to be true
      end

      let(:winning_board) { Game.new([ [], [], [1,2,3] ]) }
      it 'returns true if game is won' do
        expect(winning_board.won?).to be true
      end
    end

    context 'when board does not fulfill winning requirements' do
      it 'returns false if game is not won' do
        expect(game.won?).to be false
      end
    end
  end
end

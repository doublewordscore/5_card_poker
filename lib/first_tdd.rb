class Array
  def my_uniq
    result = []
    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    (0...length - 1).each do |first|
      ((first + 1)..length - 1).each do |second|
        result << [first, second] if self[first] + self[second] == 0
      end
    end

    result
  end

  def my_transpose
    result = Array.new(self[0].length) { Array.new }
    (0..length-1).each do |row|
      (0..self[0].length-1).each do |col|
        result[row][col] = self[col][row]
      end
    end
    result
  end
end

def stock_picker(arr)
  result = {}
  arr.each_with_index do |first, i|
    arr.each_with_index do |second, j|
      next if i >= j
      profit = second - first
      result[[i, j]] = profit  # [profit, days]
    end
  end

  max_profit = result.values.sort.last
  answer = []
  result.each { |k, v| answer << k if v == max_profit }
  answer.min_by { |el| el[1] - el[0] }
end

class Game

  attr_reader :towers

  def initialize(towers = [[1, 2, 3], [], []])
    @towers = towers
  end

  def move(from_tower, to_tower)
    if @towers[to_tower].empty? || @towers[to_tower].first < @towers[from_tower]
      @towers[to_tower] << @towers[from_tower].shift
    else
      raise "Error!"
    end
  end

  def won?
    return true if @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
    false
  end

end

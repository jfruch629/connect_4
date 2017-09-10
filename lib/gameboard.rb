class Gameboard
  attr_accessor :grid

  def initialize
    @grid = build_gameboard
  end

  def build_gameboard
    grid = [
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['|', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, '|'],
      ['','A','B','C','D','E','F','G','H','I','J',''],
    ]
    # => constructs gameboard
  end

  def clear_gameboard
    @gameboard.clear
    # => empties out the arrays to have a cleared gameboard
  end

  def current_gameboard
    # => displays gameboard with updated game pieces entered
    grid.each do |row|
      row.each do |character|
        if character.equal?(row[-1])
          puts "#{character} "
        elsif ['A','B','C','D','E','F','G','H','I','J'].include?(character)
          print " #{character}"
        elsif character.equal?(nil)
          print "  "
        else
          print "#{character}"
        end
      end
    end
  end

  def connect_4?
    # => returns true if there are 4-like game pieces in a row vertically or horizontally. This will result in a winner and the game will end.
  end

  def full?
    # => returns true if the gameboard is full. This will result in a stalemate and the game will end.
  end
end

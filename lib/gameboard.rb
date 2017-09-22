class Gameboard
  attr_accessor :grid

  def initialize
    @grid = build_gameboard
  end

  def build_gameboard
    grid = [
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      ['|', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', ' |'],
      [' ','A','B','C','D','E','F','G','H','I','J',''],
    ]
  end

  def clear_gameboard
    @gameboard.clear
  end

  def current_gameboard
    grid.each do |row|
      row.each do |character|
        if character.equal?(row[-1])
          puts " #{character}"
        elsif ['A','B','C','D','E','F','G','H','I','J','X','0'].include?(character)
          print " #{character}"
        else
          print "#{character}"
        end
      end
    end
  end

  def connect_4_horizontal
    winner = ' '
    x_counter = 0
    o_counter = 0
    grid.each do |row|
      row.each do |char|
        if char == "X"
          x_counter += 1
          o_counter = 0
        elsif char == "0"
          o_counter += 1
          x_counter = 0
        else
          x_counter = 0
          o_counter = 0
        end
        if o_counter == 4
          winner = "0"
        elsif x_counter == 4
          winner = "X"
        end
      end
    end
    winner
  end

  def connect_4_vertical
    winner = ' '
    x_counter = 0
    o_counter = 0
    column_array = Array.new(10, '')
    grid[0..-2].each_with_index do |row, row_index|
      row[1..-2].each_with_index do |char, char_index|
        column_array[char_index] += char
      end
    end
    column_array.each do |column|
      x_counter = 0
      o_counter = 0
      column.each_char do |char|
        if char == "X"
          x_counter += 1
          o_counter = 0
        elsif char == "0"
          o_counter += 1
          x_counter = 0
        else
          x_counter = 0
          o_counter = 0
        end
        if o_counter == 4
          winner = "X"
        elsif x_counter == 4
          winner = "0"
        end
      end
    end
    winner
  end

  def full_column?(letter)
    full = true
    column_array = Array.new()
    grid.each do |row|
      row.each_with_index do |space, index|
        if index == grid[-1].index(letter)
          column_array << space
        end
      end
    end
    if column_array.any? { |space| space == "  "}
      full = false
    end
    full
  end

  def stalemate?
    stalemate = true
    @grid.each do |row|
      if (row.any? { |space| space == "  "})
        stalemate = false
      end
    end
    stalemate
  end
end

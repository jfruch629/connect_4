require_relative '../lib/gameboard'

class Game
  attr_reader :players, :gameboard
  attr_accessor :winner, :stalemate

  def initialize(players = [], winner = false, stalemate = false)
    @players = players
    @winner = winner
    @stalemate = stalemate
    @gameboard = Gameboard.new
  end

  def play_turn(player)
    valid_answer = false
    while valid_answer == false
      choice = gets.chomp
      if !['A','B','C','D','E','F','G','H','I','J'].include?(choice)
        puts "That's not a valid column letter. Please enter A, B, C, D, E, F, G, H, I, or J to enter a game piece in it's respective column."
      elsif gameboard.full_column?(choice)
        puts "That column is full. You must select another column."
      else
        valid_answer = true
      end
    end
    gameboard.grid[-1].each do |character|
      if choice == character
        column_letter_index = gameboard.grid[-1].index(character)
        puts
        puts "You selected column #{character}!"
        puts
        gameboard.grid.reverse.each do |row|
          if row[column_letter_index] == '  '
            if @players[0] == player
              row[column_letter_index] = "X"
              break
            else
              row[column_letter_index] = "0"
              break
            end
          end
        end
      end
    end
  end
end

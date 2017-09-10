require_relative '../lib/gameboard'

class Players
  attr_reader :players

  def initialize(players = [])
    @players = players

    puts "Welcome to Connect 4! Enter the names of Players 1 & 2 to get started.\n\n"
    print "Enter the name of Player 1: "
    player_1 = gets.chomp
    @players << player_1
    print "Enter the name of Player 2: "
    player_2 = gets.chomp
    @players << player_2
  end

  def play
    puts "#{players[0]}, you start. Select a column (A-J) to enter a game piece."
    winner = false
    stalemate = false
    while winner == false || stalemate == false
      choice = gets.chomp
    # => begins the game with a prompt to player 1 to select a column. While loop continues asking each player to select a column until there
    # => is a winner or a stalemate, and provide a prompt of who won
  end

  def continue?
    continue = true
    valid_answer = false
    while valid_answer == false
      puts "Would you like to play again? (y/n)"
      replay = gets.chomp
      if replay == "n"
        continue = false
        valid_answer = true
      elsif replay == "y"
        valid_answer = true
        gameboard = Gameboard.new
      else
        puts "Please enter y or n"
      end
    end
  end
end

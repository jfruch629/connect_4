# =>  GameBoard class
  # =>  Initialized by a grid (array of arrays 10 x 10).
  # =>  .fill(column) method that fills that column selected in the proper position
# =>  Players class
    # =>  One object of players class that represents two people. Array of two players.
    # => Maybe a while loop that continuously goes from player_1 to player_2 asking for a next move until a winner is found.
    # =>  player_1 goes first. While the game is not one, each player is continuously prompted of where they would like to drop their game pieces.
    # =>  If it can't be dropped(full) prompt again.
    # =>  If the user selects the column that wins them the game, prompt a winning message
require_relative "gameboard"
require_relative "players"

gameboard = Gameboard.new
players = Players.new
# => Need to implement a way to continously display the gameboard until a winner is announced or until there is a stalemate
players.play
gameboard.current_gameboard
# require 'pry'
# binding.pry

players.continue?

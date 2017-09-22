require_relative "gameboard"
require_relative "game"

continue = true
# => While the game can continue even after a winner is found
while continue == true
  game = Game.new

  puts "Welcome to Connect 4! Enter the names of Players 1 & 2 to get started.\n\n"
  print "Enter the name of Player 1: "
  player_1 = gets.chomp
  game.players << player_1
  print "Enter the name of Player 2: "
  player_2 = gets.chomp
  game.players << player_2

  puts
  game.gameboard.current_gameboard
  puts

  # => While the game continues, allow each player to enter a game piece(where permitted), and check for a winner.
  game_over = false
    while game_over == false
      game.players.each_with_index do |player, player_index|
        puts
        puts "#{player}, select a column (A-J) to enter a game piece."
        game.play_turn(game.players[player_index])
        game.gameboard.current_gameboard
        if game.gameboard.connect_4_horizontal == "X" || game.gameboard.connect_4_horizontal == "0" || game.gameboard.connect_4_vertical == "X" || game.gameboard.connect_4_vertical == "0"
          puts "We have a winner! Congratulations, #{player}!!"
          game_over = true
          break
        elsif game.gameboard.stalemate?
          puts "We have reached a stalemate! No winner."
          game_over = true
        end
      end
    end




  # => Prompt to ask if the players want to play again
  valid_answer = false
  puts "Would you like to play again? (Y/N): "
  while valid_answer == false
    replay = gets.chomp
    if replay == "Y" || replay == "y"
      puts "Restarting..."
      continue = true
      valid_answer = true
    elsif replay == "N" || replay == "n"
      puts "Goodbye!"
      continue = false
      valid_answer = false
      break
    else
      puts "Please enter yes(Y) or no(N): "
    end
  end
end

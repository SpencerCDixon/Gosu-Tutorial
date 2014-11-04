require 'pry'
#The user is playing against a computer opponent in Rock, Paper, Scissors.
#A game consists of a series of rounds until either player has won.
#The first player to win two rounds is declared the winner and the game ends.
#The number of rounds won by the player and the computer are shown each round.
#Output the winner of the game before exiting.
#The computer opponent randomly chooses between rock, paper, and scissors each round.
#The user chooses their shape by typing "r" (rock), "p" (paper), or "s" (scissors) each round.
#If the player enters an invalid shape, print an error message and start the next round.
#If both players choose the same shape, it is a tie and no one wins the round.

introduction = <<-eos
Welcome to Rock, Paper, Scissors! The objective is to win 2 out of 3 games.
To choose an option enter either 'r', 'p', or 's'.\n
eos

valid_shapes = ["r", "p", "s"]
winning_combos = [["r","s"], ["p","r"], ["s", "p"]]
player_score = 0
computer_score = 0

puts introduction
while player_score < 2 || computer_score < 2
  puts "Score: Player = #{player_score} | Computer = #{computer_score}\n"
  print "Choose rock (r), paper (p), or scissors (s): "
  player_input = gets.chomp

  until valid_shapes.include?(player_input)
    puts "That is an invalid option, please select r, p, or s"
    print "Choose rock (r), paper (p), or scissors (s): "
    player_input = gets.chomp
  end

  computer_input = ["r", "p", "s"].sample
  puts
  puts "Player chose: #{player_input}"
  puts "Computer chose: #{computer_input}\n"

  if winning_combos.include?([player_input, computer_input])
    puts "Player wins\n"
    player_score += 1
  elsif player_input == computer_input
    puts "It's a tie!\n"
  else
    puts "Computer wins\n"
    computer_score += 1
  end
end

if player_score > 2
  puts "You win!"
else
  puts "Computer wins this one. Try again next time."
end


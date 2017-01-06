require_relative "card"
require_relative "deck"
require_relative "hand"

deck = Deck.new
player = Hand.new(deck.deal(2))
computer = Hand.new(deck.deal(2))

puts deck.cards.size
puts "Welcome to Blackjack!\n"

player.cards.each do |card|
  puts "Player was dealt #{card.card}"
end

puts "Player score: #{player.calculate_hand}\n"

game_end = false
#Player part
continue = true

while continue do
  print "\nHit or stand (H/S): "

  while
    input = STDIN.gets.chomp.downcase
    if !["h", "s"].include?(input)
      puts "Invalid input, enter H or S"
    else
      break
    end
  end

  if input == "h"
    player.hit!(deck.deal(1))
    puts "\nPlayer was dealt #{ player.cards.flatten![-1].card}\n"
    puts "Player score: #{player.calculate_hand}\n"

    if player.calculate_hand > 21
      continue = false
      game_end = true
      puts "\nBust! You lose..."
    end
  else
    puts "\nPlayer score: #{player.calculate_hand}\n"
    continue = false
    game_end = false
  end
end

#dealer part
if !game_end
  puts "\n\n"
  computer.cards.each do |card|
    puts "Dealer was dealt #{card.card}"
  end

  puts "Dealer score: #{computer.calculate_hand}\n"

  while computer.calculate_hand < 17 do
    computer.hit!(deck.deal(1))
    puts "\nDealer was dealt #{ computer.cards.flatten![-1].card}\n"
    puts "Dealer score: #{computer.calculate_hand}\n"
  end

  puts "\nDealer stands.\n"

  if computer.calculate_hand > 21
    puts "\nBust! You win!"
  elsif  player.calculate_hand == computer.calculate_hand
    puts "\nTie!"
  elsif player.calculate_hand > computer.calculate_hand
    puts "\nYou win!"
  else
    puts "\nBust! You lose.."
  end
end

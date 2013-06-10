#This is the card game War. It consists of two players and one deck of 52 playing cards.
#The card deck is shuffled and all cards are dealt to the two players.
#Player 1 goes first and lays down the top card.
#Player 2 then lays down their top card.
#The player with the highest card wins both cards and then the next round continues.
#If both players play a card of the same value then they go to War.
#The players each lay down the next two cards face down and then expose the third card.
#The player with the highest card value wins all of the cards unless it is a tie.
#War continues until a player wins.
# The game is won when one player collects all of the other players cards.

puts "Welcome to War!"
# class Cards

#   def initialize(ranks, suits)
#     deck_of_cards = []
#     ranks = %w{2 3 4 5 6 7 8 9 10 J Q K A}
#     suits = %w{Spades Hearts Diamonds Clubs}
#     suits.each do |suit|
#       ranks.size.times do |i|
#         deck_of_cards << Card.new( ranks[i], suit, i+1 )
#       end
#     end
#   end
# end
deck_of_cards = [ {"2C"=>2}, {"3C"=>3}, {"4C"=>4}, {"5C"=>5}, {"6C"=>6}, {"7C"=>7}, {"8C"=>8}, {"9C"=>9}, {"10C"=>10}, {"JC"=>11}, {"QC"=>12}, {"KC"=>13}, {"AC"=>14},
                 {"2D"=>2}, {"3D"=>3}, {"4D"=>4}, {"5D"=>5}, {"6D"=>6}, {"7D"=>7}, {"8D"=>8}, {"9D"=>9}, {"10D"=>10}, {"JD"=>11}, {"QD"=>12}, {"KD"=>13}, {"AD"=>14},
                 {"2H"=>2}, {"3H"=>3}, {"4H"=>4}, {"5H"=>5}, {"6H"=>6}, {"7H"=>7}, {"8H"=>8}, {"9H"=>9}, {"10H"=>10}, {"JH"=>11}, {"QH"=>12}, {"KH"=>13}, {"AH"=>14},
                 {"2S"=>2}, {"3S"=>3}, {"4S"=>4}, {"5S"=>5}, {"6S"=>6}, {"7S"=>7}, {"8S"=>8}, {"9S"=>9}, {"10S"=>10}, {"JS"=>11}, {"QS"=>12}, {"KS"=>13}, {"AS"=>14}]
deck_of_cards = deck_of_cards.shuffle
puts  deck_of_cards.inspect

player1 = []
player2 = []

26.times do |deal|
player1 << deck_of_cards.slice!(0)
player2 << deck_of_cards.slice!(0)
end
puts player1.inspect
puts player2.inspect

puts "Would you like to play with me? Y or N"

response = gets.chomp
  if response == "Y" || response == "y"
    puts "It's time for War!"
  else
      abort("Have a good day 'Chicken!'")

  end

puts "Ready for me to deal the cards? 'Y' or 'N'"
  response = gets.chomp
  if response == "Y" || response == "y"
    puts []
  else
    puts "Too bad, I'm dealing anyways!"
  end
puts "Dealer has #{player1.length} cards and you have #{player2.length} cards"
puts "Ready for battle? 'Y' or 'N'"
  response = gets.chomp
  if response == "Y" || response == "y"
    puts "Dealer draws #{player1.slice!(0)}" #shows each players card on the table
    puts "You draw #{player2.slice!(0)}" #takes top card out of player array
    if player1.slice(0) > player2.slice(0)
      player1 << player1.slice(0)
      player1 << player2.slice(0)
      puts "Dealer Wins!"
    else  player1.slice(0) < player2.slice(0)
      player2 << player1.slice(0)
      player2 << player2.slice(0)
      puts "You Win!"

    #after the cards are shown- need to determine value and then push both cards to winner's array
    end
   puts "Dealer has #{player1.length} cards and you have #{player2.length} cards"
   puts "Battle again? 'Y' or 'N'?"
    response = gets.chomp
    if response == "Y" || response == "y"
      #until response == 'N' || response != 'n'
        puts "Dealer draws #{player1.slice!(0)}" #shows each players card on the table
        puts "You draw #{player2.slice!(0)}" #takes top card out of player array
        if player1.slice(0) > player2.slice(0)
          player1 << player1.slice(0)
          player1 << player2.slice(0)
        else  player1.slice(0) < player2.slice(0)
          player2 << player1.slice(0)
          player2 << player2.slice(0)

        #after the cards are shown- need to determine value and then push both cards to winner's array
        end
      end
    #end
   puts "Dealer has #{player1.length} cards and you have #{player2.length} cards"
  else
    abort("See yeah!")
  end

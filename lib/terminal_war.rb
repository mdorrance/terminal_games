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

deck_of_cards = [ "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC",
                  "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", "AD",
                  "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", "AH",
                  "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS", "AS"]
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

puts "Ready for me to deal the cards?"
  response = gets.chomp
  if response == "Y" || response == "y"
    puts []
  else
    puts "Too bad, I'm dealing anyways!"
  end
puts "Dealer has #{player1.length} cards and you have #{player2.length} cards"
puts "Ready for the first battle? 'Y' or 'N'"
  response = gets.chomp
  if response == "Y" || response == "y"
    puts player1.slice!(0) #shows each players card on the table
    puts player2.slice!(0) #takes top card out of player array
    if player1.slice(0) > player2.slice(0)
      player1 << player1.slice(0)
      player1 << player2.slice(0)
    else  player1.slice(0) < player2.slice(0)
      player2 << player1.slice(0)
      player2 << player2.slice(0)
    #after the cards are shown- need to determine value and then push both cards to winner's array
    end
   puts "Dealer has #{player1.length} cards and you have #{player2.length} cards"
  else
    abort("See yeah!")
  end

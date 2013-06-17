#This is the card game War. It consists of two players and one deck of 52 playing cards.
#The card deck is shuffled and all cards are dealt to the two players.
#Player 1 goes first and lays down the top card.
#Player 2 then lays down their top card.
#The player with the highest card wins both cards and then the next round continues.
#If both players play a card of the same value then they go to War.
#The players each lay down the next two cards face down and then expose the last card.
#The player with the highest card value wins all of the cards unless it is a tie.
#War continues until a player wins.
# The game is won when one player collects all of the other players cards.

puts "Welcome to War!"

deck_of_cards =[ {:card=>"2C",:value=>2}, {:card=>"3C",:value=>3}, {:card=>"4C",:value=>4}, {:card=>"5C",:value=>5}, {:card=>"6C",:value=>6}, {:card=>"7C",:value=>7}, {:card=>"8C",:value=>8}, {:card=>"9C",:value=>9}, {:card=>"10C",:value=>10}, {:card=>"JC",:value=>11}, {:card=>"QC",:value=>12}, {:card=>"KC",:value=>13}, {:card=>"AC",:value=>14},
                 {:card=>"2D",:value=>2}, {:card=>"3D",:value=>3}, {:card=>"4D",:value=>4}, {:card=>"5D",:value=>5}, {:card=>"6D",:value=>6}, {:card=>"7D",:value=>7}, {:card=>"8D",:value=>8}, {:card=>"9D",:value=>9}, {:card=>"10D",:value=>10}, {:card=>"JD",:value=>11}, {:card=>"QD",:value=>12}, {:card=>"KD",:value=>13}, {:card=>"AD",:value=>14},
                 {:card=>"2H",:value=>2}, {:card=>"3H",:value=>3}, {:card=>"4H",:value=>4}, {:card=>"5H",:value=>5}, {:card=>"6H",:value=>6}, {:card=>"7H",:value=>7}, {:card=>"8H",:value=>8}, {:card=>"9H",:value=>9}, {:card=>"10H",:value=>10}, {:card=>"JH",:value=>11}, {:card=>"QH",:value=>12}, {:card=>"KH",:value=>13}, {:card=>"AH",:value=>14},
                 {:card=>"2S",:value=>2}, {:card=>"3S",:value=>3}, {:card=>"4S",:value=>4}, {:card=>"5S",:value=>5}, {:card=>"6S",:value=>6}, {:card=>"7S",:value=>7}, {:card=>"8S",:value=>8}, {:card=>"9S",:value=>9}, {:card=>"10S",:value=>10}, {:card=>"JS",:value=>11}, {:card=>"QS",:value=>12}, {:card=>"KS",:value=>13}, {:card=>"AS",:value=>14}]
deck_of_cards = deck_of_cards.shuffle
puts  deck_of_cards.inspect

dealer = []
player1 = []

26.times do
dealer << deck_of_cards.slice!(0)
player1 << deck_of_cards.slice!(0)
  end
puts dealer.inspect
puts player1.inspect

puts "Would you like to play War with me? Y or N"

response = gets.chomp
  if response == "Y" || response == "y"
    puts "It's time for War!"
  else
      abort("Have a good day 'Chicken!'")

  end

puts "Ready for me to deal the cards? 'Y' or 'N'"
  response = gets.chomp
  if response == "Y" || response == "y"

  else
    puts "Too bad, I'm dealing anyways!"
  end
puts "Dealer has #{dealer.length} cards and you have #{player1.length} cards"

    puts "Ready for battle? 'Y' or 'N'"
      response = gets.chomp.upcase
      if response == "Y"
        until dealer == [] || player1 == []
        dealer_battle = []
        player1_battle = []
        dealer_battle_value = []
        player1_battle_value = []
        puts dealer.slice(0).class
        puts player1.slice(0).class
        dealercard = dealer.slice!(0)
        player1card = player1.slice!(0)
        dealer_battle << dealercard
        player1_battle << player1card
        puts dealer_battle.class
        puts player1_battle.class

        dealer_battle_value = (dealer_battle.map{|h| h[:value].to_i})
        player1_battle_value = (player1_battle.map{|h| h[:value].to_i})
        puts "Dealer draws #{dealer_battle}" #shows each players card on the table
        puts "You draw #{player1_battle}" #takes top card out of player array
        puts dealer_battle_value
        puts player1_battle_value
        puts dealer_battle_value <=> player1_battle_value
        battle_value = dealer_battle_value <=> player1_battle_value
        puts battle_value
         if battle_value == 1
          dealer << dealercard
          dealer << player1card
          puts "Dealer Wins!"

          elsif  battle_value == -1
            player1 << dealercard
            player1 << player1card
            puts "You Win!"

          else battle_value == 0
            dealer_battle1 = []
            player1_battle1 = []
            dealer_battle_value1 = []
            player1_battle_value1 = []
            dealercard1 = dealer.slice!(1)
            player1card1 = player1.slice!(1)
            dealer_battle1 << dealercard1
            player1_battle1 << player1card1
            puts dealer_battle1
            puts player1_battle1
            dealer_battle_value1.concat(dealer_battle1.map{|h| h[:value].to_i})
            player1_battle_value1.concat(player1_battle1.map{|h| h[:value].to_i})

            puts "Dealer draws #{dealer_battle1}" #shows each players card on the table
            puts "You draw #{player1_battle1}" #takes top card out of player array
            puts dealer_battle_value1
            puts player1_battle_value1
            puts dealer_battle_value1 <=> player1_battle_value1
            battle_value = dealer_battle_value1 <=> player1_battle_value1
            puts battle_value
             if battle_value == 1
              dealer << dealercard
              dealer << player1card
              dealer << player1.slice!(0)
              dealer << dealer.slice!(0)
              dealer << dealercard1
              dealer << player1card1
              puts "Dealer Wins!"

            elsif  battle_value == -1
              player1 << dealercard
              player1 << dealer.slice!(0)
              player1 << player1card
              player1 << player1.slice!(0)
              player1 << dealercard1
              player1 << player1card1
              puts "You Win!"

            else battle_value == 0
              dealer_battle2 = []
              player1_battle2 = []
              dealer_battle_value2 = []
              player1_battle_value2 = []
              dealercard2 = dealer.slice!(1)
              player1card2 = player1.slice!(1)
              dealer_battle2 << dealercard2
              player1_battle2 << player1card2
              dealer_battle_value.concat(dealer_battle2.map{|h| h[:value].to_i})
              player1_battle_value.concat(player1_battle2.map{|h| h[:value].to_i})

                puts "Dealer draws #{dealer_battle2}" #shows each players card on the table
                puts "You draw #{player1_battle2}" #takes top card out of player array
                puts dealer_battle_value2
                puts player1_battle_value2
                puts dealer_battle_value2 <=> player1_battle_value2
                battle_value = dealer_battle_value2 <=> player1_battle_value2
                puts battle_value
                 if battle_value == 1
                  dealer << dealercard
                  dealer << player1card
                  dealer << player1.slice!(0)
                  dealer << dealer.slice!(0)
                  dealer << dealercard1
                  dealer << player1card1
                  dealer << dealercard2
                  dealer << player1card2
                  dealer << player1.slice!(0)
                  dealer << dealer.slice!(0)
                  puts "Dealer Wins!"

                elsif  battle_value == -1
                  player1 << dealercard
                  player1 << dealer.slice!(0)
                  player1 << player1card
                  player1 << player1.slice!(0)
                  player1 << dealercard1
                  player1 << player1card1
                  player1 << dealercard2
                  player1 << player1card2
                  player1 << player1.slice!(0)
                  player1 << dealer.slice!(0)
                  puts "You Win!"
                end
        #after the cards are shown- need to determine value and then push both cards to winner's array
        #after approx 24 battles new arrays that are pushed into player array get to index 0 and break the .map method
        #trying to learn how to iterate an array of hashes in an
            end
          end

       puts "Dealer has #{dealer.length} cards and you have #{player1.length} cards"

       puts dealer.inspect
       puts player1.inspect
     end

  else
    abort("See yeah!")
  end





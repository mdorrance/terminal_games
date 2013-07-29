# This is the card game War. It consists of two players and one deck of 52 playing cards.
# The card deck is shuffled and all cards are dealt to the two players.
# Player 1 goes first and lays down the top card.
# Player 2 then lays down their top card.
# The player with the highest card wins both cards and then the next round continues.
# If both players play a card of the same value then they go to War.
# The players each lay down the next card face down and then expose the second card.
# The player with the highest card value wins all of the cards unless it is a tie.
# War continues until a player wins.
# The game is won when one player collects all of the other players cards, a player runs out of
# cards during a War or one player quits.


# asks the player if they want to play the game
def play_prompt
  puts "Would you like to play War with me? Y or N"
  response = gets.chomp
  if response == "Y" || response == "y"
    puts "It's time for War!"
    deal_prompt
  else
    abort("Have a good day 'Chicken!'")
  end
end

# asks the player if they are ready for the cards to be dealt
def deal_prompt
  puts "Ready for me to deal the cards? 'Y' or 'N'"
  response = gets.chomp
    if response == "Y" || response == "y"
      deal_cards
    else
      puts "Too bad, I'm dealing anyways!"
    end
  puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
  battle_prompt
end

# creates a deck of cards with suits and card values
def deal_cards
  deck_of_cards =[ {:card=>"2C",:value=>2}, {:card=>"3C",:value=>3}, {:card=>"4C",:value=>4}, {:card=>"5C",:value=>5}, {:card=>"6C",:value=>6}, {:card=>"7C",:value=>7}, {:card=>"8C",:value=>8}, {:card=>"9C",:value=>9}, {:card=>"10C",:value=>10}, {:card=>"JC",:value=>11}, {:card=>"QC",:value=>12}, {:card=>"KC",:value=>13}, {:card=>"AC",:value=>14},
                 {:card=>"2D",:value=>2}, {:card=>"3D",:value=>3}, {:card=>"4D",:value=>4}, {:card=>"5D",:value=>5}, {:card=>"6D",:value=>6}, {:card=>"7D",:value=>7}, {:card=>"8D",:value=>8}, {:card=>"9D",:value=>9}, {:card=>"10D",:value=>10}, {:card=>"JD",:value=>11}, {:card=>"QD",:value=>12}, {:card=>"KD",:value=>13}, {:card=>"AD",:value=>14},
                 {:card=>"2H",:value=>2}, {:card=>"3H",:value=>3}, {:card=>"4H",:value=>4}, {:card=>"5H",:value=>5}, {:card=>"6H",:value=>6}, {:card=>"7H",:value=>7}, {:card=>"8H",:value=>8}, {:card=>"9H",:value=>9}, {:card=>"10H",:value=>10}, {:card=>"JH",:value=>11}, {:card=>"QH",:value=>12}, {:card=>"KH",:value=>13}, {:card=>"AH",:value=>14},
                 {:card=>"2S",:value=>2}, {:card=>"3S",:value=>3}, {:card=>"4S",:value=>4}, {:card=>"5S",:value=>5}, {:card=>"6S",:value=>6}, {:card=>"7S",:value=>7}, {:card=>"8S",:value=>8}, {:card=>"9S",:value=>9}, {:card=>"10S",:value=>10}, {:card=>"JS",:value=>11}, {:card=>"QS",:value=>12}, {:card=>"KS",:value=>13}, {:card=>"AS",:value=>14}]
  deck_of_cards = deck_of_cards.shuffle
  #puts deck_of_cards.inspect  #verifies the shuffle

  @player = []
  @dealer = []

  26.times do
  @player << deck_of_cards.slice!(0)
  @dealer << deck_of_cards.slice!(0)
    end
  # puts @player.inspect # verifies the player hand
  # puts @dealer.inspect # verifies the dealer hand
end

# pulls and evaluates the dealer's top card
def dealer_draw
  dealer_battle = []
  dealer_battle_value = []
  # puts @dealer.slice(0).class # used to understand the relationships of objects being passed
  @dealercard = @dealer.slice!(0)
  dealer_battle << @dealercard
  # puts dealer_battle.class # used to understand the relationships of objects being passed
  @dealer_battle_value = (dealer_battle.map{|h| h[:value].to_i})
end

# pulls and evaluates the player's top card
def player_draw
  player_battle = []
  player_battle_value = []
  # puts @player.slice(0).class # used to understand the relationships of objects being passed
  @playercard = @player.slice!(0)
  player_battle << @playercard
  # puts player_battle.class # used to understand the relationships of objects being passed
  @player_battle_value = (player_battle.map{|h| h[:value].to_i})
end

# evaluates and decides which player wins and pushes all cards into winner's hand
# handles single war and double war
def card_evaluation
  # puts @dealer_battle_value <=> @player_battle_value # used to validate the operation
  battle_value = @dealer_battle_value <=> @player_battle_value
  # puts battle_value # used to validate the variable definition

  if battle_value == 1
    @dealer << @dealercard
    @dealer << @playercard
    puts "Dealer Wins!"
    puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
    # puts @dealer.inspect # used to show how cards were injecting into array
    # puts @player.inspect # used to show how cards were injecting into array
    battle_prompt

  elsif  battle_value == -1
    @player << @dealercard
    @player << @playercard
    puts "You Win!"
    puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
    # puts @dealer.inspect # used to show how cards were injecting into array
    # puts @player.inspect # used to show how cards were injecting into array
    battle_prompt

  elsif battle_value == 0 && @dealer.length > 2 || battle_value == 0 && @player.length > 2
    puts "There is a TIE! PREPARE FOR WAR!!!!"
    if @dealer.length < 3
      puts "Dealer is out of cards and you win! Want to play again? Y or N?"
      deal_prompt
      battle_prompt

    elsif @player.length < 3
      puts "You are out of cards! You lose! Want to play again? Y or N?"
      deal_prompt
      battle_prompt

    else
      dealer_battle1 = []
      player_battle1 = []
      dealer_battle_value1 = []
      player_battle_value1 = []
      dealercard1 = @dealer.slice!(1)
      playercard1 = @player.slice!(1)
      dealer_battle1 << dealercard1
      player_battle1 << playercard1
      # puts dealer_battle1 #used to verify type of object being passed
      # puts player_battle1 #used to verify type of object being passed
      dealer_battle_value1.concat(dealer_battle1.map{|h| h[:value].to_i})
      player_battle_value1.concat(player_battle1.map{|h| h[:value].to_i})
      puts "Dealer draws #{dealer_battle1}" #shows each players card on the table
      puts "You draw #{player_battle1}" #takes top card out of player array
      # puts dealer_battle_value1 # used to validate while developing
      # puts player_battle_value1 # used to validate while developing
      # puts dealer_battle_value1 <=> player_battle_value1
      battle_value = dealer_battle_value1 <=> player_battle_value1
      # puts battle_value # used to validate the operation and variable

      if battle_value == 1
        @dealer << @playercard
        @dealer << playercard1
        @dealer << @player.slice!(0)
        @dealer << @dealercard
        @dealer << dealercard1
        @dealer << @dealer.slice!(0)
        puts "Dealer Wins the War and 3 of your cards!!!"
        puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
        # puts @dealer.inspect # used to show how cards were injecting into array
        # puts @player.inspect # used to show how cards were injecting into array
        battle_prompt

      elsif  battle_value == -1
        @player << @dealercard
        @player << dealercard1
        @player << @dealer.slice!(0)
        @player << @playercard
        @player << playercard1
        @player << @player.slice!(0)
        puts "You Win the War and 3 of the Dealer's cards!!!"
        puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
        # puts @dealer.inspect # used to show how cards were injecting into array
        # puts @player.inspect # used to show how cards were injecting into array
        battle_prompt

      else battle_value == 0 && @dealer.length > 2 || battle_value == 0 && @player.length > 2
        puts "There is ANOTHER TIE! PREPARE FOR A DOUBLE WAR!!!!"
        if @dealer.length < 3
          puts "Dealer is out of cards and you win! Want to play again? Y or N?"
          deal_prompt
          battle_prompt
        elsif @player.length < 3
          puts "You are out of cards! You lose! Want to play again? Y or N?"
          deal_prompt
          battle_prompt
        else
          dealer_battle2 = []
          player_battle2 = []
          dealer_battle_value2 = []
          player_battle_value2 = []
          dealercard2 = @dealer.slice!(1)
          playercard2 = @player.slice!(1)
          dealer_battle2 << dealercard2
          player_battle2 << playercard2
          dealer_battle_value2.concat(dealer_battle2.map{|h| h[:value].to_i})
          player_battle_value2.concat(player_battle2.map{|h| h[:value].to_i})
          puts "Dealer draws #{dealer_battle2}" #shows each players card on the table
          puts "You draw #{player_battle2}" #takes top card out of player array
          # puts dealer_battle_value2 # used to validate while developing
          # puts player_battle_value2 # used to validate while developing
          # puts dealer_battle_value2 <=> player_battle_value2 # used to validate while developing
          battle_value = dealer_battle_value2 <=> player_battle_value2
          # puts battle_value # used to validate operation and variable while developing
           if battle_value == 1
            @dealer << @dealercard
            @dealer << dealercard1
            @dealer << dealercard2
            @dealer << @dealer.slice!(0)
            @dealer << @dealer.slice!(1)
            @dealer << @dealer.slice!(2)
            @dealer << @playercard
            @dealer << playercard1
            @dealer << playercard2
            @dealer << @player.slice!(0)
            @dealer << @player.slice!(1)
            @dealer << @player.slice!(2)
            puts "Dealer Wins the DOUBLE WAR and 6 of your cards!!!"
            puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
            # puts @dealer.inspect # used to show how cards were injecting into array
            # puts @player.inspect # used to show how cards were injecting into array
            battle_prompt

          elsif  battle_value == -1
            @player << @dealercard
            @player << dealercard1
            @player << dealercard2
            @player << @dealer.slice!(0)
            @player << @dealer.slice!(1)
            @player << @dealer.slice!(2)
            @player << @playercard
            @player << playercard1
            @player << playercard2
            @player << @player.slice!(0)
            @player << @dealer.slice!(1)
            @player << @dealer.slice!(2)
            puts "You Win the DOUBLE WAR and 6 of the Dealer's cards!!!"
            puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
            # puts @dealer.inspect # used to show how cards were injecting into array
            # puts @player.inspect # used to show how cards were injecting into array
          else battle_value == 0 && @dealer.length > 2 || battle_value == 0 && @player.length > 2
            puts "There is a THIRD TIE! PREPARE FOR A TRIPLE WAR!!!!"
            if @dealer.length < 3
              puts "Dealer is out of cards and you win! Want to play again? Y or N?"
              deal_prompt
              battle_prompt
            elsif @player.length < 3
              puts "You are out of cards! You lose! Want to play again? Y or N?"
              deal_prompt
              battle_prompt
            else
              dealer_battle3 = []
              player_battle3 = []
              dealer_battle_value3 = []
              player_battle_value3 = []
              dealercard3 = @dealer.slice!(5)
              playercard3 = @player.slice!(5)
              dealer_battle3 << dealercard3
              player_battle3 << playercard3
              dealer_battle_value3.concat(dealer_battle3.map{|h| h[:value].to_i})
              player_battle_value3.concat(player_battle3.map{|h| h[:value].to_i})
              puts "Dealer draws #{dealer_battle3}" #shows each players card on the table
              puts "You draw #{player_battle3}" #takes top card out of player array
              # puts dealer_battle_value3 # used to validate while developing
              # puts player_battle_value3 # used to validate while developing
              # puts dealer_battle_value3 <=> player_battle_value3 # used to validate while developing
              battle_value = dealer_battle_value3 <=> player_battle_value3
              # puts battle_value # used to validate operation and variable while developing
               if battle_value == 1
                @dealer << @dealercard
                @dealer << dealercard1
                @dealer << dealercard2
                @dealer << dealercard3
                @dealer << @dealer.slice!(0)
                @dealer << @dealer.slice!(1)
                @dealer << @dealer.slice!(2)
                @dealer << @dealer.slice!(3)
                @dealer << @dealer.slice!(4)
                @dealer << @playercard
                @dealer << playercard1
                @dealer << playercard2
                @dealer << playercard3
                @dealer << @player.slice!(0)
                @dealer << @player.slice!(1)
                @dealer << @player.slice!(2)
                @dealer << @player.slice!(3)
                @dealer << @player.slice!(4)
                puts "Dealer Wins the TRIPLE WAR and 9 of your cards!!!"
                puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
                # puts @dealer.inspect # used to show how cards were injecting into array
                # puts @player.inspect # used to show how cards were injecting into array
                battle_prompt

              elsif  battle_value == -1
                @player << @dealercard
                @player << dealercard1
                @player << dealercard2
                @player << dealercard3
                @player << @dealer.slice!(0)
                @player << @dealer.slice!(1)
                @player << @dealer.slice!(2)
                @player << @dealer.slice!(3)
                @player << @dealer.slice!(4)
                @player << @playercard
                @player << playercard1
                @player << playercard2
                @player << playercard3
                @player << @player.slice!(0)
                @player << @player.slice!(1)
                @player << @player.slice!(2)
                @player << @player.slice!(3)
                @player << @player.slice!(4)
                puts "You Win the TRIPLE WAR and 9 of the Dealer's cards!!!"
                puts "Dealer has #{@dealer.length} cards and you have #{@player.length} cards"
                # puts @dealer.inspect # used to show how cards were injecting into array
                # puts @player.inspect # used to show how cards were injecting into array
                battle_prompt
              end
            end
          end
        end
      end
    end
  end
end
#initiates a ticker to keep track of the number of battles
@num_battles = 0

#defines the battle sequence and evaluation for playing a single round
def battle_prompt
  if @dealer.length == 52 #validates if there is a winner
    puts "Dealer wins! Nice try! Want to play again? Y or N?"
    deal_prompt
    battle_prompt
  elsif @player.length == 52 #validates if there is a winner
    puts "You win! Good job! Want to play again? Y or N?"
    deal_prompt
    battle_prompt
  else
    puts "Ready for battle? 'Y' or 'N'"
    response = gets.chomp.upcase
    if response == "Y"
      @num_battles = @num_battles + 1
      if @num_battles == 1
        puts "This is your first battle."
        dealer_draw # calls the dealer_draw method
        player_draw # calls the player_draw method
        puts "Dealer draws #{@dealercard}" #shows each players card on the table
        puts "You draw #{@playercard}" #takes top card out of player array
        card_evaluation
      else
        puts "You have played #{@num_battles} battles."
        dealer_draw # calls the dealer_draw method
        player_draw # calls the player_draw method
        puts "Dealer draws #{@dealercard}" #shows each players card on the table
        puts "You draw #{@playercard}" #takes top card out of player array
        card_evaluation
      end
    else
      puts "You quit so the dealer wins! Have a good one!"
    end
  end
end

puts "Welcome to War!"
play_prompt




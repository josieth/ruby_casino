require_relative "deck"
require_relative "card"

class Blackjack
  attr_accessor :player, :deck, :winnings, :cards

def initialize(player)
  puts player
  @deck = Deck.new
  @winnings = 0
  run_game
end

def run_game
  puts "\nWelcome to the Blackjack table."
  print "\nEnter your bet, or type 'quit' to exit back to the main menu: "
  bet0 = gets.strip
  return @winnings if bet0 == "quit"
  bet = 0
  bet = bet0.to_f
  card1 = @deck.cards.sample
  card2 = @deck.cards.sample
  puts "\nYour cards are: #{card1.rank} of #{card1.suit} and #{card2.rank} of #{card2.suit}."
  if card1.rank != "A" && card2.rank != "A"
    total = card1.value + card2.value
    puts "\nYour cards total #{total}."
  elsif card1.rank == "A" && card2.rank == "A"
    total = 12
    puts "\nYour cards total 12."
  elsif card1.rank == "A"
    total = card2.value + 1
    alt_total = card2.value + 11
    puts "\nYour cards total either #{total} or #{alt_total}."
  elsif card2.rank == "A"
    total = card1.value + 1
    alt_total = card1.value + 11
    puts "\nYour cards total either #{total} or #{alt_total}."
  end
  dcard1 = @deck.cards.sample
  dcard2 = @deck.cards.sample
  puts "\nThe dealer's first card is: #{dcard1.rank} of #{dcard1.suit}."
  if dcard1.rank != "A" && dcard2.rank != "A"
    dtotal =  dcard1.value + dcard2.value
    dalt_total = dcard1.value + dcard2.value
  elsif dcard1.rank == "A" && dcard2.rank == "A"
    total = 2
    dalt_total = 12
  elsif dcard1.rank == "A"
    dtotal = dcard2.value + 1
    dalt_total = dcard2.value + 11
  elsif dcard1.rank == "A"
    dtotal = dcard1.value + 1
    dalt_total = dcard1.value + 11
  end
  print "\n(1) Hit, (2) Stand ? "
  option = gets.strip.to_i
  if option == 1
    card3 = @deck.cards.sample
    puts "\nYour third card is: #{card3.rank} of #{card3.suit}."
    if card3.rank != "A" && alt_total == nil # no ace, no prior ace
      total += card3.value
      puts "\nYour cards total #{total}."
      if total > 21
        puts "\nBust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank == "A" && alt_total == nil # ace, but no prior ace
      total += 1
      alt_total = total + 10
      puts "\nYour cards total #{total} or #{alt_total}."
      if total > 21 && alt_total > 21
        puts "\nBust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank != "A" && alt_total != nil # no ace, but prior ace
      total += card3.value
      alt_total += card3.value
      puts "\nYour cards total either #{total} or #{alt_total}."
      if total > 21 && alt_total > 21
        puts "\nBust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank == "A" && alt_total != nil
      total += 1
      alt_total += 11
      alt_total2 = total + 10
      alt_total3 = alt_total + 1
      puts "\nYour cards total either #{total}, #{alt_total}, #{alt_total2}, or #{alt_total3}."
      if total > 21 && alt_total > 21 && alt_total2 > 21 && alt_total3 > 21
        puts "\nBust! Next hand..."
        @winnings -= bet
        run_game
      end
    end
  end
  if option == 1
    print "\n(1) Hit, (2) Stand ? "
    option2 = gets.strip.to_i
    if option2 == 1
      card4 = @deck.cards.sample
      puts "\nYour fourth card is: #{card4.rank} of #{card4.suit}."
      if card4.rank != "A" && alt_total == nil # no ace, no prior ace
        total += card4.value
        puts "\nYour cards total #{total}."
        if total > 21
          puts "\nBust! Next hand..."
          @winnings -= bet
          run_game
        end
      elsif card4.rank == "A" && alt_total == nil # ace, but no prior ace
        total += 1
        alt_total = total + 11
        puts "\nYour cards total #{total} or #{alt_total}."
        if total > 21 && alt_total > 21
          puts "\nBust! Next hand..."
          @winnings -= bet
          run_game
        end
      elsif card4.rank != "A" && alt_total != nil && alt_total2 == nil # no ace, but prior ace in round 1 only
        total += card4.value
        alt_total += card4.value
        puts "\nYour cards total either #{total} or #{alt_total}."
        if total > 21 && alt_total > 21
          puts "\nBust! Next hand..."
          @winnings -= bet
          run_game
        end
    elsif card4.rank != "A" && alt_total != nil && alt_total2 != nil # no ace, but prior ace in rounds 1 and 2
      total += card4.value
      alt_total += card4.value
      alt_total2 += card4.value
      alt_total3 += card4.value
      puts "\nYour cards total either #{total}, #{alt_total}, #{alt_total2}, or #{alt_total3}."
      if total > 21 && alt_total > 21
        puts "\nBust! Next hand..."
        @winnings -= bet
        run_game
      end
  elsif card4.rank == "A" && alt_total != nil && alt_total2 == nil # ace, and prior ace in round 1 or 2 only
    total += 1
    alt_total += 11
    puts "\nYour cards total either #{total} or #{alt_total}"
    if total > 21 && alt_total > 21
      puts "\nBust! Next hand..."
      @winnings -= bet
      run_game
    end
  elsif card4.rank == "A" && alt_total != nil && alt_total2 != nil # ace, and prior aces in both rounds 1 and 2
    total += 1
    alt_total += 11
    alt_total2 += 1
    alt_total3 += 11
    alt_total4 = alt_total2 + 10
    alt_total5 = alt_total3 - 10
    puts "\nYour cards total either #{total}, #{alt_total}, #{alt_total2}, #{alt_total3}, #{alt_total4}, or #{alt_total5}."
    if total > 21 && alt_total > 21
      puts "\nBust! Next hand..."
      @winnings -= bet
      run_game
    end
  end
end
end
  puts "\nDealer's turn..."
  puts "\nThe dealer's second card is: #{dcard2.rank} of #{dcard2.suit}."
  if (dtotal < 17) && (dalt_total < 17)
    dcard3 = @deck.cards.sample
    puts "\nDealer's third card is: #{dcard3.rank} of #{dcard3.suit}."
    if dcard3.rank != "A" && dcard1.rank != "A" && dcard2.rank != "A" # no ace, no prior ace
      dtotal += dcard3.value
      puts "\nDealer's cards total #{dtotal}."
      if dtotal > 21
        puts "\nDealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank == "A" && dcard1.rank != "A" && dcard2.rank != "A" # ace, but no prior ace
      dtotal += 1
      dalt_total = dtotal + 10
      puts "\nDealer's cards total #{dtotal} or #{dalt_total}."
      if dtotal > 21 && dalt_total > 21
        puts "\nDealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank != "A" && (dcard1.rank == "A" || dcard2.rank == "A") # no ace, but prior ace
      dtotal += dcard3.value
      dalt_total += dcard3.value
      puts "\nDealer's cards total either #{dtotal} or #{dalt_total}."
      if dtotal > 21 && dalt_total > 21
        puts "\nDealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank == "A" && (dcard1.rank == "A" || dcard2.rank == "A")
      dtotal += 1
      dalt_total += 11
      dalt_total2 = dtotal + 10
      dalt_total3 = dalt_total - 10
      puts "\nDealer's cards total either #{dtotal}, #{dalt_total}, #{dalt_total2}, or #{dalt_total3}."
      if dtotal > 21 && dalt_total > 21 && dalt_total2 > 21 && dalt_total3 > 21
        puts "\nDealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    end
  end
  d_all = []
  (dalt_total = 0) if dalt_total == nil
  (dalt_total2 = 0) if dalt_total2 == nil
  (dalt_total3 = 0) if dalt_total3 == nil
  d_all << dtotal << dalt_total << dalt_total2 << dalt_total3
  dcurrent_high = 0
  d_all.each do |value|
    if ((value > dcurrent_high) && (value <= 21))
      dcurrent_high = value
    end
  end
  puts "\nDealer's cards final total: #{dcurrent_high}."
  all = []
  (alt_total = 0) if alt_total == nil
  (alt_total2 = 0) if alt_total2 == nil
  (alt_total3 = 0) if alt_total3 == nil
  all << total << alt_total << alt_total2 << alt_total3
  current_high = 0
  all.each do |value|
    if (value > current_high) && (value <= 21)
      current_high = value
    end
  end
  puts "\nYour cards final total: #{current_high}."
  if current_high > dcurrent_high
    puts "\nYou won!"
    @winnings += bet
  else
    puts "\nYou lost!"
    @winnings -= bet
  end
  print "\nPlay again (Y/N)? "
  play_again = gets.strip.downcase
  run_game if play_again == "y"
end
end

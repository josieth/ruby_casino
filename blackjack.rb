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
  puts "How much is your bet? Or, type quit to exit back to menu: "
  bet = gets.strip
  return @winnings if bet == "quit"
  bet = bet.to_f
  card1 = @deck.cards.sample
  card2 = @deck.cards.sample
  puts "Your cards are: #{card1.rank} of #{card1.suit} and #{card2.rank} of #{card2.suit}."
  if card1.rank != "A" && card2.rank != "A"
    total = card1.value + card2.value
    puts "Your cards total #{total}."
  elsif card1.rank == "A" && card2.rank == "A"
    total = 12
    puts "Your cards total 12."
  elsif card1.rank == "A"
    total = card2.value + 1
    alt_total = card2.value + 11
    puts "Your cards total either #{total} or #{alt_total}."
  elsif card2.rank == "A"
    total = card1.value + 1
    alt_total = card1.value + 11
    puts "Your cards total either #{total} or #{alt_total}."
  end
  dcard1 = @deck.cards.sample
  dcard2 = @deck.cards.sample
  puts "The dealer's first card is: #{dcard1.rank} of #{dcard1.suit}."
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
  puts "(1) Hit, (2) Stand ?"
  option = gets.strip.to_i
  if option == 1
    card3 = @deck.cards.sample
    puts "Your third card is: #{card3.rank} of #{card3.rank}."
    if card3.rank != "A" && alt_total == nil # no ace, no prior ace
      total += card3.value
      puts "Your cards total #{total}."
      if total > 21
        puts "Bust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank == "A" && alt_total == nil # ace, but no prior ace
      total += 1
      alt_total = total + 10
      puts "Your cards total #{total} or #{alt_total}."
      if total > 21 && alt_total > 21
        puts "Bust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank != "A" && alt_total != nil # no ace, but prior ace
      total += card3.value
      alt_total += card3.value
      puts "Your cards total either #{total} or #{alt_total}."
      if total > 21 && alt_total > 21
        puts "Bust! Next hand..."
        @winnings -= bet
        run_game
      end
    elsif card3.rank == "A" && alt_total != nil
      total += 1
      alt_total += 11
      alt_total2 = total + 10
      alt_total3 = alt_total + 1
      puts "Your cards total either #{total}, #{alt_total}, #{alt_total2}, or #{alt_total3}."
      if total > 21 && alt_total > 21 && alt_total2 > 21 && alt_total3 > 21
        puts "Bust! Next hand..."
        @winnings -= bet
        run_game
      end
    end
  end
    puts "(1) Hit, (2) Stand ?"
    option2 = gets.strip.to_i
    if option2 == 1
      card4 = @deck.cards.sample
      puts "Your fourth card is: #{card4.rank} of #{card4.rank}."
      if card4.rank != "A" && alt_total == nil # no ace, no prior ace
        total += card4.value
        puts "Your cards total #{total}."
        if total > 21
          puts "Bust! Next hand..."
          @winnings -= bet
          run_game
        end
      elsif card4.rank == "A" && alt_total == nil # ace, but no prior ace
        total += 1
        alt_total = total + 11
        puts "Your cards total #{total} or #{alt_total}."
        if total > 21 && alt_total > 21
          puts "Bust! Next hand..."
          @winnings -= bet
          run_game
        end
      elsif card4.rank != "A" && alt_total != nil && alt_total2 == nil # no ace, but prior ace in round 1 only
        total += card4.value
        alt_total += card4.value
        puts "Your cards total either #{total} or #{alt_total}."
        if total > 21 && alt_total > 21
          puts "Bust! Next hand..."
          @winnings -= bet
          run_game
        end
    elsif card4.rank != "A" && alt_total != nil && alt_total2 != nil # no ace, but prior ace in rounds 1 and 2
      total += card4.value
      alt_total += card4.value
      alt_total2 += card4.value
      alt_total3 += card4.value
      puts "Your cards total either #{total}, #{alt_total}, #{alt_total2}, or #{alt_total3}."
      if total > 21 && alt_total > 21
        puts "Bust! Next hand..."
        @winnings -= bet
        run_game
      end
  elsif card4.rank == "A" && alt_total != nil && alt_total2 == nil # ace, and prior ace in round 1 or 2 only
    total += 1
    alt_total += 11
    puts "Your cards total either #{total} or #{alt_total}"
    if total > 21 && alt_total > 21
      puts "Bust! Next hand..."
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
    puts "Your cards total either #{total}, #{alt_total}, #{alt_total2}, #{alt_total3}, #{alt_total4}, or #{alt_total5}."
    if total > 21 && alt_total > 21
      puts "Bust! Next hand..."
      @winnings -= bet
      run_game
    end
  end
end
  puts "Dealer's turn..."
  puts "The dealer's second card is: #{dcard2.rank} of #{dcard2.suit}."
  if (dtotal < 17) && (dalt_total < 17)
    dcard3 = @deck.cards.sample
    puts "Dealer's third card is: #{dcard3.rank} of #{dcard3.suit}."
    if dcard3.rank != "A" && dcard1.rank != "A" && dcard2.rank != "A" # no ace, no prior ace
      dtotal += dcard3.value
      puts "Dealer's cards total #{dtotal}."
      if dtotal > 21
        puts "Dealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank == "A" && dcard1.rank != "A" && dcard2.rank != "A" # ace, but no prior ace
      dtotal += 1
      dalt_total = dtotal + 10
      puts "Dealer's cards total #{dtotal} or #{dalt_total}."
      if dtotal > 21 && dalt_total > 21
        puts "Dealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank != "A" && (dcard1.rank == "A" || dcard2.rank == "A") # no ace, but prior ace
      dtotal += dcard3.value
      dalt_total += dcard3.value
      puts "Dealer's cards total either #{dtotal} or #{dalt_total}."
      if dtotal > 21 && dalt_total > 21
        puts "Dealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    elsif dcard3.rank == "A" && (dcard1.rank == "A" || dcard2.rank == "A")
      dtotal += 1
      dalt_total += 11
      dalt_total2 = dtotal + 10
      dalt_total3 = dalt_total - 10
      puts "Dealer's cards total either #{dtotal}, #{dalt_total}, #{dalt_total2}, or #{dalt_total3}."
      if dtotal > 21 && dalt_total > 21 && dalt_total2 > 21 && dalt_total3 > 21
        puts "Dealer busts! Next hand..."
        @winnings += bet
        run_game
      end
    end
  end
  d_all = []
  d_all << dtotal << dalt_total << dalt_total2 << dalt_total3
  dcurrent_high = 0
  d_all.each do |value|
    if ((value > dcurrent_high) && (value <= 21))
      dcurrent_high = value
    end
  end
  puts "Dealer's cards total: #{dcurrent_high}"
  all = []
  all << dtotal << dalt_total << dalt_total2 << dalt_total3
  current_high = 0
  all.each do |value|
    if (value > current_high) && (value <= 21)
      current_high = value
    end
  end
  puts "Your cards total: #{current_high}"
  if current_high > dcurrent_high
    puts "You won."
    @winnings += bet
  else
    puts "You lost."
    @winnings -= bet
  end
  run_game
end
end

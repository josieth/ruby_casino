class Blackjack

def initialize(player)
  @deck = Deck.new
  run_game
end

def run_game
  puts "How much is your bet?"
  bet = gets.strip.to_f
  card1 = @cards.sample
  card2 = @cards.sample
  puts "Your cards are: #{card1[0]} of #{card1[1]} and #{card2[0]} of #{card2[1]}."
  if card1[0] != "A" && card2[0] != "A"
    total = card1.value + card2.value
    puts "Your cards total #{total}."
  elsif card1[0] == "A" && card2[0] == "A"
    total = 12
    puts "Your cards total 12."
  elsif card1[0] == "A"
    total = card2.value + 1
    alt_total = card2.value + 11
    puts "Your cards total either #{total} or #{alt_total}."
  end
  dcard1 = @cards.sample
  dcard2 = @cards.sample
  puts "The dealer's first card is: #{dcard1[0]} of #{dcard1[1]}."
  if dcard1[0] != "A" && dcard2[0] != "A"
    dtotal = dcard1.value + dcard2.value
  elsif dcard1[0] == "A" && dcard2[0] == "A"
    dtotal = 12
  elsif dcard1[0] == "A"
    dtotal = dcard2.value + 1
    dalt_total = dcard2.value + 11
  end
  puts "(1) Hit, (2) Double, (3) Stand, (4) Surrender ?"
  option = gets.strip.to_i
  case option
  when 1
    card3 = @cards.sample
    puts "Your third card is: #{card3[0]} of #{card3[1]}."
    if card3[0] != "A" && alt_total = nil
      total += card3.value
      puts "Your cards total #{total}."
    elsif card3[0] == "A" && alt_total = nil
      total += 1
      alt_total = total + 11
      puts "Your cards total #{total} or #{alt_total}."
    elsif card1[0] == "A"
      total = card2[0].value + 1
      alt_total = card2[0].value + 11
      puts "Your cards total either #{total} or #{alt_total}."
    end


# Blackjack.new(@player)

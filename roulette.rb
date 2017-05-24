@roulette_array = [
  [1, "Red", "Odd"],
  [2, "Black", "Even"],
  [3, "Red", "Odd"],
  [4, "Black", "Even"],
  [5, "Red", "Odd"],
  [6, "Black", "Even"],
  [7, "Red", "Odd"],
  [8, "Black", "Even"],
  [9, "Red", "Odd"],
  [10, "Black", "Even"],
  [11, "Black", "Odd"],
  [12, "Red", "Even"],
  [13, "Black", "Odd"],
  [14, "Red", "Even"],
  [15, "Black", "Odd"],
  [16, "Red", "Even"],
  [17, "Black", "Odd"],
  [18, "Red", "Even"],
  [19, "Red", "Odd"],
  [20, "Black", "Even"],
  [21, "Red", "Odd"],
  [22, "Black", "Even"],
  [23, "Red", "Odd"],
  [24, "Black", "Even"],
  [25, "Red", "Odd"],
  [26, "Black", "Even"],
  [27, "Red", "Odd"],
  [28, "Black", "Even"],
  [29, "black", "Odd"],
  [30, "Red", "Even"],
  [31, "Black", "Odd"],
  [32, "Red", "Even"],
  [33, "Black", "Odd"],
  [34, "Red", "Even"],
  [35, "Black", "Odd"],
  [36, "Red", "Even"],
]
def roulette_bet
  puts "Welcome to Roulette!"
  puts "What do you want to bet on?"
  puts "1) Red/Black"
  puts "2) Even/Odd"
  case gets.to_i
  when 1
    red_black
  when 2
    even_odd 
  end
end

def red_black
  puts "How much do you want to bet?"
  bet = gets.to_i
  puts "Do you want to bet on red or black?"
  puts "1) Red"
  puts "2) Black"
  red_black_choice
end

def red_black_choice
  @choice = gets.strip
  if @choice == "1"
    @choice = "Red"
  elsif @choice == "2"
    @choice = "Black"
  else 
    puts "Invalid input. Try again!"
    red_black_choice
  end
  red_black_results
end

def red_black_results
  @number = @roulette_array.sample
  if @choice == @number[1]
    puts "You win!"
  else
    puts "You lose!"
  end
end

def generate_spin
  @number = @roulette_array.sample
end
roulette_bet

def even_odd
  puts "How much do you want to bet?"
  bet = gets.to_i
  puts "Do you want to bet on even or odd?"
  puts "1) Even"
  puts "2) Odd"
  even_odd_choice
end

def even_odd_choice
  @choice = gets.strip
  if @choice == "1"
    @choice = "Even"
  elsif @choice == "2"
    @choice = "Odd"
  else 
    puts "Invalid input. Try again!"
    even_odd_choice
  end
  even_odd_results
end

def even_odd_results
  @number = @roulette_array.sample
  if @choice == @number[2]
    puts "You win!"
  else
    puts "You lose!"
  end
end

def generate_spin
  @number = @roulette_array.sample
end
roulette_bet



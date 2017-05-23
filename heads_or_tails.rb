class HeadsTails
  def initialize(player)
    puts "Welcome to Heads or Tails!"
    puts "#{player.name} you have a balance of: #{player.wallet.amount}"
    #ask them how much they want to bet
    puts "How much do you want to bet?"
      #I can make sure it's an integer
    bet_amount = gets.to_i
    dealer_heads_tails = rand(2)
    puts "Do you want heads or tails?"
    puts "Choose 0 for heads or 1 for tails"
      #I want to make sure it's a 0 or 1
      #if 0 elsif else
    user_heads_tails = gets.to_i
    if dealer_heads_tails == user_heads_tails 
      puts "You win!" #add money
    else
      puts "You lose" #subtract money
    end
    puts "Do you want to play again? yes / no"
    play_again = gets.strip.downcase
    #case satement
    case play_again
    when "yes", "y"
      HeadsTails.new(player)
    when "no", "n"
      puts "quit"
    end
  end
end
#decide how to build wallet how to add money or subtract money
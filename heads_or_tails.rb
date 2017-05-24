class HeadsTails
  def initialize(player)
    puts "Welcome to Heads or Tails!"
    puts "#{player.name} you have a balance of: #{player.wallet.amount}"
    puts "How much do you want to bet?"
    bet_amount = gets.to_i
    dealer_heads_tails = rand(2)
    puts "Do you want heads or tails?"
    puts "Choose 0 for heads or 1 for tails"
    user_heads_tails = gets.to_i
    if dealer_heads_tails == user_heads_tails 
      puts "You win!" 
    else
      puts "You lose"
    end
    
    puts "Do you want to play again? yes / no"
    play_again = gets.strip.downcase
    case play_again
    when "yes", "y"
      HeadsTails.new(player)
    when "no", "n"
      puts "quit"
    end
  end
end
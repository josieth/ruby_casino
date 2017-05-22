require_relative "wallet"

class Player
  attr_accessor :name, :age, :gender, :wallet

  def initialize
    # need to think about how to implement the wallet
    # this could(should) be a class
    # or just an attribute on the user
    puts 'What is your name player?'
    @name = gets.strip
    puts "What is your age #{@name}?" #string interpolation needs double quotes
    @age = gets.strip.to_i
    puts "What is your gender #{@name}?"
    @gender = gets.strip
    puts "How much money are you playing with?"
    @wallet =  Wallet.new(gets.strip.to_f)

    #puts 'new player!'
  end
end

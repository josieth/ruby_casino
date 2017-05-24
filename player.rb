require_relative "wallet"

class Player
  attr_accessor :name, :age, :gender, :wallet

  def initialize
    puts 'What is your name player?'
    @name = gets.strip
    puts "What is your age #{@name}?" #string interpolation needs double quotes
    @age = gets.strip.to_i
    puts "What is your gender #{@name}?"
    @gender = gets.strip
    puts "How much money are you playing with?"
    @wallet =  Wallet.new(gets.strip.to_f)

  end

  def get_name
    return @name
  end
end

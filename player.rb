require_relative "wallet"

class Player
  attr_accessor :name, :age, :gender, :wallet

  def initialize
    print "\nWhat is your name, player? "
    @name = gets.strip
    print "\nWhat is your age, #{@name}? "
    @age = gets.strip.to_i
    print "\nWhat is your gender, #{@name}? "
    @gender = gets.strip
    print "\nHow much money are you playing with? "
    @wallet =  Wallet.new(gets.strip.to_f)
  end

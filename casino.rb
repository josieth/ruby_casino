#All gems up here
require 'pry'
require 'colorize'
#Pull in other classes you may need
require_relative 'player'
require_relative 'heads_or_tails'
require_relative 'blackjack'


class Casino
  attr_accessor :player

  def initialize
    puts "\nWelcome to the Ruby Casino!"
    @player = Player.new
    casino_menu
  end

  def casino_menu
    puts "\nWhat game would you like to play, #{@player.name}?"
    print "\n(1) Heads or tails enter\n(2) Blackjack\n(3) Poker\n(4) Exit the casino\n\nEnter selection: "

    game_choice = gets.chomp.to_i

    case game_choice
      when 1
        HeadsTails.new(@player)
      when 2
        Blackjack.new(@player)
      when 3
        Roulette.new(@player)
      when 4
        puts "\nThank you for visiting. Goodbye."
        exit
      else
        puts "\nInvalid selection."
        casino_menu
    end
  end
end

Casino.new

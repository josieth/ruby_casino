#All gems up here
require 'pry'
require 'colorize'

#Pull in other classes you may need
require_relative 'player'
require_relative 'heads_or_tails'

class Casino
  attr_accessor :player

  def initialize
    puts 'Welcome To Our Ruby Casino!'
    @player = Player.new
    # need a casino menu method
    casino_menu
  end

  def casino_menu
    #casino options
    #game options
    # bank-roll
    #quit
    HeadsTails.new(player)
  end


end


Casino.new

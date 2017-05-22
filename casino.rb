#All gems up here
require 'pry'
require 'colorize'

#Pull in other classes you may need
require_relative 'player'

class Casino
  attr_accessor :player
  def initialize
    puts 'Welcome To Our Ruby Casino!'
    @player = Player.new
    binding.pry
  end
end

Casino.new

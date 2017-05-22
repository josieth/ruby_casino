#All gems up here
require 'pry'
require 'colorize'

#Pull in other classes you may need
require_relative 'player'

class Casino
  def initialize
    puts 'Welcome To Our Ruby Casino!'
    @player = Player.new 
  end
end

Casino.new
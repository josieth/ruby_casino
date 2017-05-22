class Card

 attr_accessor :rank, :suit, :color, :value, :alt_value

 # card = Card.new('10', 'K', 'Black')
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
   @value = rank.to_i
   if rank == 'J' || rank == 'Q' || rank == 'K'
     @value = 10
   elsif rank == "A"
     @value = 11
     @alt_value = 1
   end
 end
end

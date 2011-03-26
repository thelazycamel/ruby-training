module Dice
  
  class Roller
  
    attr_accessor :result, :total
  
    def initialize(no_of_dice=1,sides=6)
      @no_of_dice = no_of_dice
      @sides = sides
      @result = []
    end
  
    def result
      @result
    end
  
    def throw
      @result.clear
      @no_of_dice.times do |die|
        @result << rand(@sides) + 1
      end
      @result
    end
  
    def total
      @result.inject(:+)
    end
    
  end
    
      
end
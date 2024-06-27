require_relative 'display.rb'
require_relative 'game.rb'
class Comp
  include Display
  attr_accessor :name
  def initialize
    @name = 'Megatron'
  end
  
  def submit_guess(guess_number)
    puts display_comp_guess_prompt(guess_number)
    guess = @@color_arr.shuffle.take(1)
    return guess
  end
      
end
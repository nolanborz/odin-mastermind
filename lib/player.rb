require_relative 'player.rb'
require_relative 'display.rb'
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def submit_guess(guess_number)
    puts display_guess_prompt(guess_number)
    guess = gets.chomp
    
    return guess
  end
      
end

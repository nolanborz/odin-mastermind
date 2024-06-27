require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'game.rb'
class Player
  include Display
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

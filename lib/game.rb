require_relative 'player.rb'
require_relative 'display.rb'

class Game
  include Display
  attr_reader :player, :color_answers
  def initialize
    @player = nil
    @color_answers = nil
    @color_arr = ['red', 'orange', 'yellow', 'blue', 'green', 'purple', 'white', 'black']
  end
  
  def play_game
    game_setup
  end

  def game_setup
    @player = create_player
    puts "Ok, so your name is #{self.player.name}.\nLet's play some Mastermind."
    sleep(1)
    @color_answers = generate_random_colors
  end
  
  def create_player
    puts display_name_prompt
    name = gets.chomp
    Player.new(name)
  end

  def generate_random_colors
    return @color_arr.shuffle.take(3)
  end

  
end
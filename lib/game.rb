require_relative 'player.rb'
require_relative 'display.rb'

class Game
  include Display
  attr_reader :player
  def initialize
    @player = nil
  end
  
  def play_game
    puts generate_random_colors
  end

  def game_setup
    @player = create_player
    puts "Ok, so your name is #{self.player.name}"
    sleep(1)
    puts generate_random_colors
  end
  
  def create_player
    puts display_name_prompt
    name = gets.chomp
    Player.new(name)
  end

  def generate_random_colors
    color_key = {1 => 'red', 2 => 'blue', 3 => 'orange', 4 => 'green', 5 => 'purple', 6 => 'yellow', 7 => 'white', 8 => 'black'}
    arr = gather_numbers
    return arr.map {|i| i = color_key[i]}
  end
  def num_to_color(arr)
    color_key = {1 => 'red', 2 => 'blue', 3 => 'orange', 4 => 'green', 5 => 'purple', 6 => 'yellow', 7 => 'white', 8 => 'black'}
  end
  def gather_numbers
    return (1..8).to_a.shuffle.take(3)
  end
end
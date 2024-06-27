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
    game_loop

  end

  def game_loop
    for i in 1..5 do 
      process_guesses(get_player_guesses, i)
    end

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

  def get_player_guesses
    puts @color_answers
    guess_arr = []
    until guess_arr.length == 3
      puts "Current guess arr #{guess_arr}"
      guess_arr.push(@player.submit_guess(guess_arr.length + 1))
    end
    puts "This was the guess#{guess_arr}"
    return guess_arr
  end
  def process_guesses(guesses, guess_number)
    right_spot = 0
    right_color = 0
    for x in guesses
      if @color_answers.include?(x) then right_color +=1
      end
    end
    puts display_guess_results(right_color, right_spot, guess_number)
  end
end
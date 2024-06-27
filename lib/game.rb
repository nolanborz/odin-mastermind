require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'comp.rb'

class Game
  include Display
  attr_reader :player, :color_answers
  def initialize
    @player = nil
    @color_answers = nil
    @@color_arr = ['red', 'orange', 'yellow', 'blue', 'green', 'purple', 'white', 'black']
    @right_spot = nil
    @game_won = false
  end
  
  def play_game
    game_setup
    game_loop
  end

  def game_loop
    @color_answers = generate_random_colors
    for i in 1..5 do 
      process_guesses(get_player_guesses, i)
      if @right_spot == 3 then game_won_procedures; @game_won = true
      break
      end
    end
    if @game_won == false then game_loss_procedures
    end

  end

  def game_setup
    @player = create_player
    puts "Ok, so your name is #{self.player.name}.\nLet's play some Mastermind."
    sleep(1)
  end
  
  def create_player
    puts display_name_prompt
    name = gets.chomp
    Player.new(name)
  end

  def generate_random_colors
    return @@color_arr.shuffle.take(3)
  end

  def get_player_guesses
    puts @color_answers
    guess_arr = []
    until guess_arr.length == 3
      puts "Current guess arr #{guess_arr}"
      guess_arr.push(@player.submit_guess(guess_arr.length + 1))
    end
    sleep(1)
    puts "This was the guess#{guess_arr}"
    return guess_arr
  end
  def process_guesses(guesses, guess_number)
    @right_spot = 0
    right_color = 0
    guesses.each_with_index do |guess, index|
      if @color_answers[index] == guess then @right_spot += 1 
      
      elsif @color_answers.include?(guess) then right_color += 1
      end
    end
    puts display_guess_results(right_color, @right_spot, guess_number)
  end

  def game_won_procedures
    puts display_game_won
  end
  def game_loss_procedures
    puts display_game_loss(@color_answers[0], @color_answers[1], @color_answers[2])
  end
end
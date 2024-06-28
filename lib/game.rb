require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'comp.rb'

class Game
  include Display
  attr_reader :player_one, :color_answers
  def initialize
    @cpu_player = nil
    @player_one = nil
    @color_answers = nil
    @@color_arr = ['red', 'orange', 'yellow', 'blue', 'green', 'purple', 'white', 'black']
    @right_spot = nil
    @game_won = false
  end

  def cpu_play_game
    game_setup
    cpu_game_loop
  end

  def cpu_game_loop
    player_pick_colors
    3.times do cpu_guess_processor(cpu_guess_colors)
    end
  end

  def cpu_guess_colors
    cpu_guesses = []
    3.times do cpu_guesses.push(@cpu_player.submit_color)
    end
    sleep(1)
    puts "#{@cpu_player.name}'s guesses are #{cpu_guesses[0]}, #{cpu_guesses[1]}, and #{cpu_guesses[2]}."
    sleep(1)
    return cpu_guesses
  end

  def cpu_guess_processor(guesses)
    @right_spot = 0
    right_color = 0
    guesses.each_with_index do |guess, index|
      if @color_answers[index] == guess then @right_spot += 1
      elsif @color_answers.include?(guess) then right_color += 1
      end
    end
    puts display_guess_results(right_color, @right_spot, 1)
  end

  def player_pick_colors
    @color_answers = []
    3.times do |i| @color_answers.push(@player_one.submit_color(i + 1))
    end
    puts @color_answers
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
    @cpu_player = Cpu.new
    @player_one = create_player
    puts "Ok, so your name is #{@player_one.name}. Let's play some Mastermind."
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
      guess_arr.push(@player_one.submit_color(guess_arr.length + 1))
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
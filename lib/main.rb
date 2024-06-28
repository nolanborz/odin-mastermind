require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'comp.rb'
def play_mastermind 
  play = Game.new
  pick_or_guess = menu_selector
  if pick_or_guess == 'p' then play.cpu_play_game
  else
    play.play_game
  end
  restart_game
end
def restart_game
  include Display
  puts display_ask_restart_game
  restart = gets.chomp
  if restart == 'y' then play_mastermind
  else
    display_goodbye_message
  end
end
def menu_selector
  include Display
  puts display_pick_or_guess
  pick_or_guess = gets.chop
  return pick_or_guess
end
play_mastermind
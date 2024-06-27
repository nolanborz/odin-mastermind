require_relative 'player.rb'
require_relative 'display.rb'
require_relative 'game.rb'
def play_mastermind 
  play = Game.new
  play.play_game
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

play_mastermind
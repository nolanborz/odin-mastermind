require_relative 'player.rb'
require_relative 'display.rb'
class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
